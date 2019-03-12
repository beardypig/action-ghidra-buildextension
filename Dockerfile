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
RUN apt-get install -y gradle ant
RUN gradle wrapper
RUN chmod +x gradlew
RUN ./gradlew wrapper --gradle-version 5.2

ENTRYPOINT ["/entrypoint.sh"]
CMD ["javac --version"]
