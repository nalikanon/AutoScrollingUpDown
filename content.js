let isRunning = false;
let scrollInterval = null;
let config = {
    interval: 5000, // Default 5s
    direction: 'down' // Default down
};

// Listen for messages from popup
chrome.runtime.onMessage.addListener((request, sender, sendResponse) => {
    if (request.action === 'start') {
        startScrolling(request.config);
    } else if (request.action === 'stop') {
        stopScrolling();
    } else if (request.action === 'updateConfig') {
        updateConfig(request.config);
    } else if (request.action === 'getStatus') {
        sendResponse({ isRunning, config });
    }
});

function startScrolling(newConfig) {
    if (isRunning) return;

    if (newConfig) {
        config = { ...config, ...newConfig };
    }

    isRunning = true;
    console.log('TikTok AutoScroll started with interval:', config.interval, 'ms');

    // Clear any existing interval just in case
    if (scrollInterval) clearInterval(scrollInterval);

    // Start the interval
    scrollInterval = setInterval(() => {
        performScroll();
    }, config.interval);
}

function stopScrolling() {
    if (!isRunning) return;

    isRunning = false;
    if (scrollInterval) {
        clearInterval(scrollInterval);
        scrollInterval = null;
    }
    console.log('TikTok AutoScroll stopped.');
}

function updateConfig(newConfig) {
    if (newConfig) {
        // If direction changed, update it immediately
        if (newConfig.direction) config.direction = newConfig.direction;

        // If interval changed, restart the interval if running
        if (newConfig.interval) {
            config.interval = newConfig.interval;
            if (isRunning) {
                clearInterval(scrollInterval);
                scrollInterval = setInterval(() => {
                    performScroll();
                }, config.interval);
            }
        }
    }
}

function performScroll() {
    // Simulate key press for navigation
    const key = config.direction === 'down' ? 'ArrowDown' : 'ArrowUp';
    const code = config.direction === 'down' ? 'ArrowDown' : 'ArrowUp';
    const keyCode = config.direction === 'down' ? 40 : 38;

    const event = new KeyboardEvent('keydown', {
        key: key,
        code: code,
        keyCode: keyCode,
        bubbles: true,
        cancelable: true
    });

    // Dispatch to document or specific container if needed
    document.dispatchEvent(event);

    // Also try dispatching to the focused element just in case
    if (document.activeElement) {
        document.activeElement.dispatchEvent(event);
    }

    console.log(`Scrolled ${config.direction}`);
}
