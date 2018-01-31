Maven Standards
==

### Project files (**pom.xml**)
All Maven project files should use the following as a template with you needing to substitute the following values:
- ARTIFACT_ID - This should match the repository name. *E.g. accounts.api.ch.gov.uk*
- NAME - This should be a 'hyphenated' version of your repository name. *E.g. accounts-api*
- PROJECT_DESCRIPTION - A brief description of your project

```
<?xml version="1.0" encoding="UTF-8"?>
<project    xmlns="http://maven.apache.org/POM/4.0.0"
            xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">

    <modelVersion>4.0.0</modelVersion>
    <groupId>uk.gov.companieshouse</groupId>
    <artifactId><ARTIFACT_ID></artifactId>
    <version>unversioned</version>
    <packaging>jar</packaging>
    <name>NAME</name>
    <description><PROJECT_DESCRIPTION></description>

    <properties>
        <!-- Encoding -->
        <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
        <project.reporting.outputEncoding>UTF-8</project.reporting.outputEncoding>

        <!-- Java -->
        <java.version>1.8</java.version>

        <!-- Dependency Versions -->
        <junit.version>4.12</junit.version>
        <structured-logging.version>1.0.0</structured-logging.version>
    </properties>

    <dependencies>
        <!-- Compile -->
        <dependency>
            <groupId>uk.gov.companieshouse</groupId>
            <artifactId>structured-logging</artifactId>
            <version>${structured-logging.version}</version>
            <scope>compile</scope>
        </dependency>

        <!-- Test -->
        <dependency>
            <groupId>junit</groupId>
            <artifactId>junit</artifactId>
            <version>${junit.version}</version>
            <scope>test</scope>
        </dependency>
    </dependencies>

    <!-- When required... -->
    <repositories>
        <repository>
            <id>release-id</id>
            <url>${MAVEN_REPOSITORY_HOST_URL}/release</url>
        </repository>
    </repositories>

    ...

</project>

```

Depending upon your requirements you may need to ensure your environment contains the necessary variables. For example:

```bash
export MAVEN_REPOSITORY_HOST_URL=http://sample/repository:8080
```
