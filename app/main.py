# app/main.py

from flask import Flask, jsonify, request
from datetime import datetime
import socket

app = Flask(__name__)

@app.route("/")
def time_service():
    return jsonify({
        "timestamp": datetime.utcnow().isoformat() + "Z",
        "ip": request.remote_addr
    })

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
