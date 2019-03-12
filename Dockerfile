FROM blacktop/ghidra

LABEL "maintainer"="beardypig <beardypig@protonmail.com>"
LABEL "repository"="https://github.com/beardypig/ghidra-buildExtension"
LABEL "homepage"="http://github.com/beardypig/ghidra-buildExtension"
LABEL "version"="1.0.0"

LABEL "com.github.actions.name"="Ghidra Extension Builder"
LABEL "com.github.actions.description"="Builds a Ghidra Extension using gradle"
LABEL "com.github.actions.icon"="play"
LABEL "com.github.actions.color"="green"

RUN apt-get update
RUN apt-get install -y ant

RUN wget https://services.gradle.org/distributions/gradle-5.2-bin.zip -P /tmp && \
    unzip -d /opt/gradle /tmp/gradle-*.zip

ENTRYPOINT ["/opt/gradle/gradle-5.2/gradle", "-PGHIDRA_INSTALL_DIR=/ghidra"]
