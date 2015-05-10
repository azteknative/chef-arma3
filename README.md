# arma3-cookbook

Installs and configures the Arma 3 dedicated server.

## Dependencies

* steamcmd cookbook - https://github.com/azteknative/steamcmd

## Supported Platforms

Currently only tested with:

* Ubuntu 14.04

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['arma3']['steam_username']</tt></td>
    <td>String</td>
    <td>User to log into Steam with.</td>
    <td><tt>changme</tt></td>
  </tr>
  <tr>
    <td><tt>['arma3']['steam_password']</tt></td>
    <td>String</td>
    <td>Password to log into Steam with.</td>
    <td><tt>changme</tt></td>
  </tr>
</table>

## Usage

### arma3::default

Include `arma3` in your node's `run_list`, and override the
`['arma3']['steam_user']` and `['arma3']['steam_password']`
with credentials from a valid Steam account:

```json
{
  "arma3" : {
    "steam_user": "exampleuser",
    "steam_password": "examplepass"
  },
  "run_list": [
    "recipe[arma3::default]"
  ]
}
```

NB: the Steam account *doesn't* have to own a copy of Arma 3. The
dedicated server is a free utility, so you can (and should) create
a separate account to host a dedicated server.

## License and Authors

Author:: Peter Green (<peter.green@aztek-native.com>)

Copyright 2015 AzTek Native Ltd.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

