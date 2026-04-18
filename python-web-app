 service="catfact-service",
    source="python",
    tags=["env:production", "app:catfacts"]
)
logger.addHandler(datadog_handler)

# Initialize Datadog for metrics
initialize(
    api_key="971437406d3b6d4169dbbb962f983d85",
    statsd_host="127.0.0.1",
    statsd_port=8125
)

def fetch_cat_fact():
    while True:
        try:
            logger.info("Fetching cat fact from API...")
            statsd.increment("catfact.request.count", tags=["action:attempt"])

            response = requests.get("https://catfact.ninja/fact", timeout=5)
            response.raise_for_status()
            data = response.json()
            fact = data.get("fact", "No fact returned")

            logger.info(f"Fetched cat fact: {fact}", extra={
                "fact_length": len(fact),
                "response_status": response.status_code
            })
            statsd.increment("catfact.request.count", tags=["action:success"])
        except Exception as e:
            logger.error(f"Failed to fetch cat fact: {str(e)}", extra={
                "error_type": type(e).__name__
            })
            statsd.increment("catfact.request.count", tags=["action:failed"])

        time.sleep(10)  # Sleep for 3 minutes

if __name__ == "__main__":
    fetch_cat_fact()m
