# TikTok Auto Scroller (Python)

A simple Python script to automatically scroll through TikTok (or any feed) by simulating the `Down Arrow` key.

## Requirements

You need Python installed. Then install the `pyautogui` library:

```bash
pip install pyautogui
```

## How to Use

1.  Open a terminal in this folder.
2.  Run the script:
    ```bash
    python autoscroll.py
    ```
    *   (Optional) You can specify the scroll interval in seconds (default is 10):
        ```bash
        python autoscroll.py 5
        ```
3.  **Immediately switch to your browser window** (e.g., Chrome/Edge with TikTok open).
4.  The script will start scrolling after a 5-second countdown.
5.  To stop, go back to the terminal and press `Ctrl+C`.

## Notes
- This script simulates actual keyboard presses. It works on any website or app, not just TikTok.
- Make sure the TikTok window is active/focused.
