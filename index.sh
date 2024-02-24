#! /bin/bash
exec &>index.html
images() {
  local indent=$1; shift
  local image
  for image in "$@"; do
    printf '%*s<img src="%s">\n' "$indent" ' ' "$image"
  done
}
cat <<EOF
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Breakout Sprites</title>
  </head>
  <body>
    <h1>Breakout Sprites</h1>
    <h2>Boxes</h2>
$(images 4 Box-*.png)
    <h2>Cracked Boxes</h2>
$(images 4 Cracked-*.png)
    <h2>Player</h2>
$(images 4 Player*.png)
    <h2>Ball</h2>
$(images 4 Ball*.png)
  </body>
</html>
EOF
