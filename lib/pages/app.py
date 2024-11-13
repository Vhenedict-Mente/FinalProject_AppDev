import cv2

# Replace with your RTSP URL
rtsp_url = "rtsp://192.168.1.37/live/ch00_0"

# Open the RTSP stream
cap = cv2.VideoCapture(rtsp_url)

if not cap.isOpened():
    print("Failed to open RTSP stream.")
else:
    print("Successfully connected to RTSP stream.")

    while True:
        # Capture frame-by-frame
        ret, frame = cap.read()
        if not ret:
            print("Failed to retrieve frame. Exiting...")
            break

        # Display the resulting frame
        cv2.imshow("RTSP Stream", frame)

        # Press 'q' to exit the loop
        if cv2.waitKey(1) & 0xFF == ord('q'):
            break

    # Release the capture and close the window
    cap.release()
    cv2.destroyAllWindows()
