# ![SciLifeLab Data Platform website](img/sciLifeLab_logo.png)

# Co-ocurrence of keywords

This site shows co-occurrence plots created using [VOS viewer](https://github.com/neesjanvaneck/VOSviewer-Online). The published image from this repo is then hosted in serve.

#### Things to know first

- `Data` folder should contain all the VOS plot JSON files (which are created using VOS java application)

- Modify the `index.html` to show the correct list of plots

- `VOSviewer-Online` is github repo, the current version here is `1.2.1`. **No modification is neccesary**, but if some other version is needed, then delete the current folder and follow the intruction mentioned below.

#### Clone and modify VOSviewer online

`VOSviewer-Online` repo should be cloned and modified for our usage. Run the following commands

- first `git clone --depth=1 https://github.com/neesjanvaneck/VOSviewer-Online.git`

- then `sed -i "" "s|publicPath: env.dev ? '/' : undefined,|publicPath: env.dev ? '/vosviewer/' : undefined,|g" VOSviewer-Online/webpack.config.babel.js`

- then `sed -i "s|to: absolute('dist', bundleName, 'images/|to: absolute('dist', bundleName, 'vosviewer-online/images/|g" VOSviewer-Online/webpack.config.babel.js`

- then `rm -rf vosviewer-online/.git*`
