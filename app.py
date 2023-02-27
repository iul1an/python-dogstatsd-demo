import os
from flask import Flask
from datadog import initialize, statsd

app = Flask(__name__)

dd_options = {
    "statsd_host": os.getenv("DD_AGENT_HOST"),
    "statsd_port": os.getenv("DD_AGENT_PORT")
}

initialize(**dd_options)
statsd.disable_telemetry()

dd_tags = os.getenv("DD_DOGSTATSD_TAGS", "").split(" ")

@app.route("/")
def index():
    statsd.increment('python-dogstatsd-demo.requests.increment', sample_rate=1, tags=dd_tags)
    return "Hello world!"

if __name__ == "__main__":
    app.run(debug=True)
