import structlog

log = structlog.get_logger(logger_name=__package__)

def main():
    logger.info("Hello, Logs!")
