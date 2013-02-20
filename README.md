# Ohajiki

Minimum Dropbox clone using Ruby and Git

## Naming
>節子，それドロップ(Drop)やない，おはじき(Ohajiki)や :「火垂るの墓」より

## Installation

    $ gem install ohajiki

## Usage
Write config file
```ruby
REMOTE_REPO_URL = 'https://github.com/kitak/ohajiki.git' # Your remote repository url (necessary entry)
SYNC_DIR_PATH = '/Users/kitak/.ohajiki' # Sync target (necessary entry)
SYNC_INTERVAL_SEC = 5 # Polling interval (optional entry. default 10)
LOGPATH = '/tmp/ohajiki.log' # Logfile location (optional entry. default /tmp/ohajiki.log)
```

start
```
ohajiki start -- -c ohajiki.conf
```

stop
```
ohajiki stop
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
