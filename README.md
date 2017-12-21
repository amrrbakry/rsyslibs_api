# Rsyslibs API
A database-driven RESTful API that looks up required system-level libraries needed for installing a ruby project dependencies.
## Usage
##### Endpoints
`POST /lookup_syslibs`

Look up required system-level packaged for your project dependencies with an array of dependencies' names and os info.
```ruby
# POST /lookup_syslibs
{
  "project_dependencies": ["nokogri"], # required
	"os_info": {
		"os": "darwin16", # required
		"os_bits": 64, # optional
		"os_vendor": "apple" # optional
	}
}
```
Response:
```ruby
[
    {
        "id": 5,
        "name": "ruby-dev",
        "version": null,
        "os": "darwin16",
        "os_bits": 64,
        "os_vendor": "apple",
        "project_dependencies": [
            {
                "id": 13,
                "name": "nokogiri",
                "version": null
            }
        ]
    }
    # ...
]
```
---
`POST /add_syslibs`

We're glad to receive any contribution to the directory. Simply, provide a dependency name, version and its required system-level libs for each operating system.
```ruby
# POST /add_syslibs

{
  "name": "Nokogiri", # required
  "version": '0.1.0', # optional
  "github_url": "https://github.com/sparklemotion/nokogiri", # optional
  "website": "http://www.nokogiri.org", # optional
  "owner_name": "Nokogiri", # optional
  "system_libraries": [
    {
		    "name": "ruby-dev", # required
        "os": "darwin16", # required
        "os_bits": 64, # optional
        "os_vendor": "apple" # optional
    },
    {
      "name": "zlib-devel",
      "os": "centOS"
    }
		# ...
  ]
}
```
---
`GET /project_dependencies`

List all project dependencies in the directory
```ruby
# GET /project_dependencies

[
    {
        "id": 13,
        "name": "nokogiri",
        "version": null,
        "system_libraries": [
            {
                "id": 5,
                "name": "ruby-dev",
                "version": null,
                "os": "darwin16",
                "os_bits": 64,
                "os_vendor": "apple"
            }
            # ...
        ]
    }
    # ...
]
```
---
`GET /system_libraries`

List all system libraries in the directory
```ruby
# GET /system_libraries

[
    {
        "id": 6,
        "name": "zlib1g-dev",
        "version": null,
        "os": "darwin16",
        "os_bits": 64,
        "os_vendor": "apple",
        "project_dependencies": [
            {
                "id": 13,
                "name": "nokogiri",
                "version": null
            }
            # ...
        ]
    }
    # ...
]
```
**I also created a simple gem that consumes this API [rsyslibs](https://github.com/Amrrbakry/rsyslibs).**

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/amrrbakry/rsyslibs_api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The project is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the rsyslibs_api project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/amrrbakry/rsyslibs/blob/master/CODE_OF_CONDUCT.md).
