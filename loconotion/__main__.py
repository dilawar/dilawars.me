import os
import sys

from .modules import main as mod_main

def _exit():
    try:
        sys.exit(1)
    except SystemExit:
        os._exit(1)

def main():
    try:
        args = mod_main.get_args()
        log = mod_main.setup_logging(args)
        parser = mod_main.init_parser(args, log)
        parser.run()
    except KeyboardInterrupt:
        log.critical("Interrupted by user")
        _exit()
    except Exception as ex:
        if args.verbose:
            log.exception(ex)
        else:
            log.critical(f"{ex.__class__.__name__}: {str(ex)}")
        _exit()

if __name__ == "__main__":
    main()
