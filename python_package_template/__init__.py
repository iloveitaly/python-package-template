import logging
import os

logging.basicConfig(
    level=os.environ.get("LOG_LEVEL", "INFO").upper(),
)

logger = logging.getLogger(__name__)


def main():
    print("Hello World!")
    logger.info("Hello, Logs!")
