RSpec.describe ParseGVP do
  it "Output Simple Result" do
    parser = ParseGVP::Parser.new
    parser.call(GVP_JSON)
    expect(parser.simple_result).to eq("current: 2, exceeded: 0, outdated: 10, unresolved: 0")
  end

  it "Output Detail Result" do
    parser = ParseGVP::Parser.new
    parser.call(GVP_JSON)
    expect(parser.detail_result).to eq(<<RESULT)
- current: 2
  - com.github.ben-manes.versions:com.github.ben-manes.versions.gradle.plugin:0.21.0
  - com.ninja-squad:DbSetup:2.1.0
- exceeded: 0
- outdated: 10
  - [com.h2database:h2](http://www.h2database.com) (1.4.197 -> 1.4.199)
  - [org.flywaydb:flyway-core](https://flywaydb.org) (5.2.3 -> 6.0.0-beta)
  - [org.projectlombok:lombok](https://projectlombok.org) (1.18.4 -> 1.18.6)
  - [org.springframework.boot:spring-boot-devtools](https://projects.spring.io/spring-boot/#/spring-boot-parent/spring-boot-devtools) (2.1.1.RELEASE -> 2.1.3.RELEASE)
  - [org.springframework.boot:spring-boot-gradle-plugin](https://projects.spring.io/spring-boot/#/spring-boot-parent/spring-boot-tools/spring-boot-gradle-plugin) (2.1.1.RELEASE -> 2.1.3.RELEASE)
  - [org.springframework.boot:spring-boot-starter-jdbc](https://projects.spring.io/spring-boot/#/spring-boot-parent/spring-boot-starters/spring-boot-starter-jdbc) (2.1.1.RELEASE -> 2.1.3.RELEASE)
  - [org.springframework.boot:spring-boot-starter-security](https://projects.spring.io/spring-boot/#/spring-boot-parent/spring-boot-starters/spring-boot-starter-security) (2.1.1.RELEASE -> 2.1.3.RELEASE)
  - [org.springframework.boot:spring-boot-starter-test](https://projects.spring.io/spring-boot/#/spring-boot-parent/spring-boot-starters/spring-boot-starter-test) (2.1.1.RELEASE -> 2.1.3.RELEASE)
  - [org.springframework.boot:spring-boot-starter-thymeleaf](https://projects.spring.io/spring-boot/#/spring-boot-parent/spring-boot-starters/spring-boot-starter-thymeleaf) (2.1.1.RELEASE -> 2.1.3.RELEASE)
  - [org.springframework.boot:spring-boot-starter-web](https://projects.spring.io/spring-boot/#/spring-boot-parent/spring-boot-starters/spring-boot-starter-web) (2.1.1.RELEASE -> 2.1.3.RELEASE)
- unresolved: 0
RESULT
  end

  GVP_JSON = <<-JSON
{
    "current": {
        "dependencies": [
            {
                "group": "com.github.ben-manes.versions",
                "version": "0.21.0",
                "projectUrl": null,
                "name": "com.github.ben-manes.versions.gradle.plugin"
            },
            {
                "group": "com.ninja-squad",
                "version": "2.1.0",
                "projectUrl": "http://dbsetup.ninja-squad.com/",
                "name": "DbSetup"
            }
        ],
        "count": 2
    },
    "gradle": {
        "current": {
            "version": "5.3.1",
            "reason": "",
            "isUpdateAvailable": true,
            "isFailure": false
        },
        "nightly": {
            "version": "5.4-20190329000047+0000",
            "reason": "",
            "isUpdateAvailable": true,
            "isFailure": false
        },
        "enabled": true,
        "releaseCandidate": {
            "version": "",
            "reason": "update check succeeded: no release available",
            "isUpdateAvailable": false,
            "isFailure": false
        },
        "running": {
            "version": "4.10.2",
            "reason": "",
            "isUpdateAvailable": false,
            "isFailure": false
        }
    },
    "exceeded": {
        "dependencies": [
            
        ],
        "count": 0
    },
    "outdated": {
        "dependencies": [
            {
                "group": "com.h2database",
                "available": {
                    "release": null,
                    "milestone": "1.4.199",
                    "integration": null
                },
                "version": "1.4.197",
                "projectUrl": "http://www.h2database.com",
                "name": "h2"
            },
            {
                "group": "org.flywaydb",
                "available": {
                    "release": null,
                    "milestone": "6.0.0-beta",
                    "integration": null
                },
                "version": "5.2.3",
                "projectUrl": "https://flywaydb.org",
                "name": "flyway-core"
            },
            {
                "group": "org.projectlombok",
                "available": {
                    "release": null,
                    "milestone": "1.18.6",
                    "integration": null
                },
                "version": "1.18.4",
                "projectUrl": "https://projectlombok.org",
                "name": "lombok"
            },
            {
                "group": "org.springframework.boot",
                "available": {
                    "release": null,
                    "milestone": "2.1.3.RELEASE",
                    "integration": null
                },
                "version": "2.1.1.RELEASE",
                "projectUrl": "https://projects.spring.io/spring-boot/#/spring-boot-parent/spring-boot-devtools",
                "name": "spring-boot-devtools"
            },
            {
                "group": "org.springframework.boot",
                "available": {
                    "release": null,
                    "milestone": "2.1.3.RELEASE",
                    "integration": null
                },
                "version": "2.1.1.RELEASE",
                "projectUrl": "https://projects.spring.io/spring-boot/#/spring-boot-parent/spring-boot-tools/spring-boot-gradle-plugin",
                "name": "spring-boot-gradle-plugin"
            },
            {
                "group": "org.springframework.boot",
                "available": {
                    "release": null,
                    "milestone": "2.1.3.RELEASE",
                    "integration": null
                },
                "version": "2.1.1.RELEASE",
                "projectUrl": "https://projects.spring.io/spring-boot/#/spring-boot-parent/spring-boot-starters/spring-boot-starter-jdbc",
                "name": "spring-boot-starter-jdbc"
            },
            {
                "group": "org.springframework.boot",
                "available": {
                    "release": null,
                    "milestone": "2.1.3.RELEASE",
                    "integration": null
                },
                "version": "2.1.1.RELEASE",
                "projectUrl": "https://projects.spring.io/spring-boot/#/spring-boot-parent/spring-boot-starters/spring-boot-starter-security",
                "name": "spring-boot-starter-security"
            },
            {
                "group": "org.springframework.boot",
                "available": {
                    "release": null,
                    "milestone": "2.1.3.RELEASE",
                    "integration": null
                },
                "version": "2.1.1.RELEASE",
                "projectUrl": "https://projects.spring.io/spring-boot/#/spring-boot-parent/spring-boot-starters/spring-boot-starter-test",
                "name": "spring-boot-starter-test"
            },
            {
                "group": "org.springframework.boot",
                "available": {
                    "release": null,
                    "milestone": "2.1.3.RELEASE",
                    "integration": null
                },
                "version": "2.1.1.RELEASE",
                "projectUrl": "https://projects.spring.io/spring-boot/#/spring-boot-parent/spring-boot-starters/spring-boot-starter-thymeleaf",
                "name": "spring-boot-starter-thymeleaf"
            },
            {
                "group": "org.springframework.boot",
                "available": {
                    "release": null,
                    "milestone": "2.1.3.RELEASE",
                    "integration": null
                },
                "version": "2.1.1.RELEASE",
                "projectUrl": "https://projects.spring.io/spring-boot/#/spring-boot-parent/spring-boot-starters/spring-boot-starter-web",
                "name": "spring-boot-starter-web"
            }
        ],
        "count": 10
    },
    "unresolved": {
        "dependencies": [
            
        ],
        "count": 0
    },
    "count": 12
}
  JSON
end
