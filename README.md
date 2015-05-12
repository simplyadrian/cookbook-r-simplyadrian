r-simplyadrian Cookbook
==================
Leverages the r_package provider from the r community cookbook to install R packages from CRAN.

Requirements
------------
#### cookbooks
- `r` - This cookbook installs additional packages for r on top of the community r cookbook.

#### packages
- `unixODBC-devel` - r-simplyadrian::rpackages needs unix ODBC development packages.
- `rinruby` - TODO: why?

Recipes
-------
#### default.rb
Installs unixODBC-devel package required by r-simplyadrian::rpackages
Calls r-simplyadrian::rpackages

#### rpackages.rb
Installs additional r packages specified in the cookbook attribute.

Attributes
----------
#### r-simplyadrian::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['r-simplyadrian']['packages']</tt></td>
    <td>Array</td>
    <td>Additional r packages to install</td>
    <td><tt>empty {}</tt></td>
  </tr>
</table>

Usage
-----
#### r-simplyadrian::default
Just include `r-simplyadrian` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[r-simplyadrian]"
  ]
}
```

In a role cookbook be sure to first include r then include r-simplyadrian. An example of using r-simplyadrian to install
several additional packages from CRAN:
node.default['r_simplyadrian']['packages'] = ["optparse", "yaml", "data.table", "ffbase", "ROCR", "ETLUtils", "rjson",
  "RODBC", "ff", "gbm", "LaF"]

License and Authors
-------------------
Authors: Adrian Herrera
