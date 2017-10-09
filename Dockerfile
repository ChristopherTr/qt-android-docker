FROM ubuntu:latest

ENV ANDROID_NDK_ROOT=/opt/android-ndk-r15c/

ADD qt-install.qs /

RUN apt-get update

RUN apt-get install -y \
	wget \
	curl \
	unzip \
	git \
	g++ \
	make

# Download/Install Android-NDK
RUN curl -LS https://dl.google.com/android/repository/android-ndk-r15c-linux-x86_64.zip -o android-ndk.zip \
	&& unzip -q android-ndk.zip -d /opt/

# Download/Install Android-SDK
RUN curl -LS https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip -o android-sdk.zip \
	&& mkdir -p /opt/android/sdk/ \
	&& unzip -q android-sdk.zip -d /opt/android/sdk/
 
# Abhängigkeiten für QT-Installer
RUN apt-get install -y \
	libgl1-mesa-glx \
	libglib2.0-0

# Abhängigkeiten für QT-Komponenten
Run apt-get install -y \
	libfontconfig1 \
	libdbus-1-3 \
	libx11-xcb1 \
	libnss3-dev \
	libasound2-dev \
	libxcomposite1 \
	libxrandr2 \
	libxcursor-dev \
	libegl1-mesa-dev \
	libxi-dev \
	libxss-dev \
	libxtst6 \
	libgl1-mesa-dev \
	default-jdk

# Download
RUN curl -LS http://download.qt.io/official_releases/qt/5.9/5.9.1/qt-opensource-linux-x64-5.9.1.run -o qt-install.run \
	&& chmod +x qt-install.run 

# Install Qt
RUN ./qt-install.run --script qt-install.qs --platform minimal -v

ENV PATH="/opt/Qt/5.9.1/android_armv7/bin:${PATH}"

RUN rm -fv \
	qt-install.run \
	android-ndk.zip \
	android-sdk.zip \
	qt-install.qs

RUN apt-get clean

CMD ["/bin/bash"]
