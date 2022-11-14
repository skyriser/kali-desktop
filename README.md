# skyriser / kali-desktop

Original Ideas from: [lukaszlach / kali-desktop](https://github.com/lukaszlach/kali-desktop)

## Features

- Use `kalilinux/kali-rolling` recent Docker image
- Use Xfce4 only

## Usage

```
docker build \
  -f Dockerfile \
  -t kali-desktop:xfce \
  --name kali-desktop
  .
```

```
docker run -d \
  -p 5900:5900 \
  -p 6080:6080 \
  --privileged \
  --name kali-desktop
```
