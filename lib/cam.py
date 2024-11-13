from flask import Flask, Response
import subprocess

app = Flask(__name__)

# Define the RTSP URLs
rtsp_url_1 = 'rtsp://192.168.1.25/live/ch00_0'
rtsp_url_2 = 'rtsp://192.168.1.25/live/ch00_0'

# Function to generate MJPEG stream using ffmpeg
def generate_mjpeg_stream(rtsp_url):
    # Set up the ffmpeg command to capture the RTSP stream and convert it to MJPEG
    command = [
        'ffmpeg', '-i', rtsp_url, '-f', 'mjpeg', '-q:v', '5', '-'
    ]
    
    process = subprocess.Popen(command, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    
    while True:
        # Read the frames from ffmpeg and yield them in MJPEG format
        frame = process.stdout.read(1024*1024)  # Read in chunks
        if not frame:
            break
        yield (b'--frame\r\n'
               b'Content-Type: image/jpeg\r\n\r\n' + frame + b'\r\n')

@app.route('/video_feed_1')
def video_feed_1():
    return Response(generate_mjpeg_stream(rtsp_url_1), mimetype='multipart/x-mixed-replace; boundary=frame')

@app.route('/video_feed_2')
def video_feed_2():
    return Response(generate_mjpeg_stream(rtsp_url_2), mimetype='multipart/x-mixed-replace; boundary=frame')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)  # Accessible from any network interface
