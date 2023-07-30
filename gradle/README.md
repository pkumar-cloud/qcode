##### build the project

    ./gradlew build

##### build the project and push to Nexus 
- Refer: https://medium.com/@simionrazvan/how-to-create-a-gradle-library-and-publish-it-on-nexus-34be19b520aa
- https://github.com/RazvanSimion/gradle-lib-nexus/blob/master/build.gradle
```bash
gradlew clean build publish
```

### Changes
Gradle wrapper version upgraded from version 6.x to 7.0 
        
###### This will change the version in wrapper.settings

     ./gradlew wrapper --gradle-version 7.0

###### This will update the complete wrapper and download version 7.0 jar

     ./gradlew wrapper --gradle-version 7.0

In build.gradle file, replace:
- compile with implementation 
- testCompile with testImplementation

Because, version 7.0 removed compile and testCompile configurations.
Source: https://docs.gradle.org/current/userguide/upgrading_version_6.html#sec:configuration_removal