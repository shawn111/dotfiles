# scrcpy

## scrcpy-desktop

https://github.com/nikp123/scrcpy-desktop

![scrcpy-tablet-mode](https://scontent.fkhh1-1.fna.fbcdn.net/v/t39.30808-6/432753527_10160235779402523_3008610799502295551_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=5f2048&_nc_ohc=TFUUBxBazK4AX_3Z2c7&_nc_ht=scontent.fkhh1-1.fna&oh=00_AfBkvMXy95idOnnJDpZcWGnqEU-Oapj9pTXYjg7Q4yl_WA&oe=65F71414)

### phone side

- enable desktop mode
- install taskbar

### desktop side

- run scrcpy-desktop/startscreen.sh
- scrcpy --list-displays
   -   --display-id=0     (1080x2400) [phone]
   -   --display-id=13    (1920x1080) [tablet]
   -   --display-id=14    (1080x2400) [phone-mirror]
- scrcpy --display-id=13

