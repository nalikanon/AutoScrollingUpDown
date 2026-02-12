import pyautogui
import time
import sys

def auto_scroll(interval=10):
    print(f"Starting auto-scroll in 5 seconds... Switch to your TikTok tab now!")
    # Countdown
    for i in range(5, 0, -1):
        print(f"{i}...", end=' ', flush=True)
        time.sleep(1)
    print("\nStarted!")

    try:
        while True:
            # Press 'down' arrow key
            pyautogui.press('down')
            print(f"Scrolled down. Waiting {interval} seconds...")
            time.sleep(interval)

            # Press 'up' arrow key
            pyautogui.press('up')
            print(f"Scrolled up. Waiting {interval} seconds...")
            time.sleep(interval)
    except KeyboardInterrupt:
        print("\nAuto-scroll stopped.")

if __name__ == "__main__":
    if len(sys.argv) > 1:
        try:
            interval_sec = int(sys.argv[1])
        except ValueError:
            print("Invalid interval provided, using default 10 seconds.")
            interval_sec = 10
    else:
        interval_sec = 10
        
    print("--------------------------------------------------")
    print("  TikTok Auto Scroller (Python Version)")
    print("  Press Ctrl+C in this terminal to stop.")
    print("--------------------------------------------------")
    
    auto_scroll(interval_sec)
