document.addEventListener('DOMContentLoaded', () => {
  const toggleBtn = document.getElementById('toggleBtn');
  const intervalSlider = document.getElementById('intervalSlider');
  const intervalValue = document.getElementById('intervalValue');
  const statusIndicator = document.getElementById('statusIndicator');
  const statusText = document.getElementById('statusText');
  const directionCheck = document.getElementById('directionCheck'); // Checkbox for direction

  // Load saved settings
  chrome.storage.local.get(['interval', 'direction'], (result) => {
    if (result.interval) {
      intervalSlider.value = result.interval;
      intervalValue.textContent = result.interval;
    }
    if (result.direction !== undefined) {
       // If direction is 'up', uncheck (since default checked is down)
       // Wait, let's designate: Checked = Down (Next), Unchecked = Up (Prev)
       directionCheck.checked = result.direction === 'down';
    } else {
       directionCheck.checked = true; // Default to down
    }
  });

  // Query active tab for current status
  chrome.tabs.query({ active: true, currentWindow: true }, (tabs) => {
    if (tabs[0]) {
      chrome.tabs.sendMessage(tabs[0].id, { action: "getStatus" }, (response) => {
        if (chrome.runtime.lastError) {
          // Content script might not be loaded yet or not a TikTok page
          console.log("Content script not found or error:", chrome.runtime.lastError.message);
          return;
        }
        if (response && response.isRunning) {
          setRunningState(true);
        }
      });
    }
  });

  // Toggle Button Click
  toggleBtn.addEventListener('click', () => {
    const isRunning = toggleBtn.classList.contains('stop');
    const action = isRunning ? 'stop' : 'start';
    const interval = parseInt(intervalSlider.value, 10) * 1000; // Convert to ms
    const direction = directionCheck.checked ? 'down' : 'up';

    chrome.tabs.query({ active: true, currentWindow: true }, (tabs) => {
      if (tabs[0]) {
        chrome.tabs.sendMessage(tabs[0].id, { 
          action: action, 
          config: { interval, direction } 
        });
        setRunningState(!isRunning);
      }
    });

    // Save settings
    chrome.storage.local.set({ 
      interval: intervalSlider.value,
      direction: direction
    });
  });

  // Slider Change
  intervalSlider.addEventListener('input', () => {
    intervalValue.textContent = intervalSlider.value;
  });

  intervalSlider.addEventListener('change', () => {
    // specific update if running
    if (toggleBtn.classList.contains('stop')) {
        const interval = parseInt(intervalSlider.value, 10) * 1000;
        chrome.tabs.query({ active: true, currentWindow: true }, (tabs) => {
            if (tabs[0]) {
              chrome.tabs.sendMessage(tabs[0].id, { 
                action: 'updateConfig', 
                config: { interval } 
              });
            }
        });
    }
    chrome.storage.local.set({ interval: intervalSlider.value });
  });
  
  // Direction Change
  directionCheck.addEventListener('change', () => {
      const direction = directionCheck.checked ? 'down' : 'up';
      if (toggleBtn.classList.contains('stop')) {
        chrome.tabs.query({ active: true, currentWindow: true }, (tabs) => {
            if (tabs[0]) {
              chrome.tabs.sendMessage(tabs[0].id, { 
                action: 'updateConfig', 
                config: { direction } 
              });
            }
        });
      }
      chrome.storage.local.set({ direction });
  });

  function setRunningState(isRunning) { // Visual update only
    if (isRunning) {
      toggleBtn.textContent = 'Stop';
      toggleBtn.classList.add('stop');
      statusIndicator.classList.add('running');
      statusText.textContent = 'Running';
    } else {
      toggleBtn.textContent = 'Start Scrolling';
      toggleBtn.classList.remove('stop');
      statusIndicator.classList.remove('running');
      statusText.textContent = 'Stopped';
    }
  }
});
