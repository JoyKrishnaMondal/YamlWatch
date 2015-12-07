##YamlWatch - Yet another Yaml Watcher


###Why

1. Better Error messages - 90% of compilations result in failure - so why are error messages terrible ?

	![Error Messages](http://i.imgur.com/NvnhkK8.png)

2. Simpler to use than Gulp.
	```
	> npm install JoyKrishnaMondal/YamlWatch
	> node -p "require('YamlWatch')()"
	```

3. Only functional API based on my other  [module](https://github.com/JoyKrishnaMondal/GeneralDev)

	+ For example if you want to do a `json` cleanup (getting rid of all `json` files that got compiled from `yaml`)
	```
	> node -p "require('YamlWatch')(0,0,1)"
	```
	+ Or if you want to **only** compile files that you edit.
	```
	> node -p "require('YamlWatch')(0,1,0)"
	```
	+ Or if you want to compile all your `yaml` source code to a distribution directory.
	```
	> node -p "require('YamlWatch')(1,0,0,"../distribution")"
	```

### Default Setting
When running without any argument:
```
> node -p "require('YamlWatch')()"
```
it does the same as:
 ```
> "require('YamlWatch')(1,1,0,process.cwd(),process.cwd())"
```
The first three arguments are flags for :

1. Initial Compilation *regardless* of file change.
2. passing `true` sets up watches
3. passing `true` does a clean up for compiled files.

The last two arguments specify the path for save for compiled files and lookup for source files in that order - for default its the directory where the script is being run from.

The details are more throughly explained in [GeneralDev](https://github.com/JoyKrishnaMondal/GeneralDev)
