# ![SciLifeLab Data Platform website](img/logos/sciLifeLab_logo.png)

# Co-ocurrence of keywords

This site shows co-occurrence plots created using [VOS viewer](https://github.com/neesjanvaneck/VOSviewer-Online).

#### Things to know first

- `Data` folder should contain all the VOS plot JSON files (which are created using VOS java application)

- `VOSviewer-Online` repo should be cloned and modified for our usage. Run the following commands
    - first `git clone --depth=1 https://github.com/neesjanvaneck/VOSviewer-Online.git`
    - then `sed -i "" "s|publicPath: env.dev ? '/' : undefined,|publicPath: env.dev ? '/vosviewer/' : undefined,|g" VOSviewer-Online/webpack.config.babel.js`
    - then `sed -i "s|to: absolute('dist', bundleName, 'images/|to: absolute('dist', bundleName, 'vosviewer-online/images/|g" VOSviewer-Online/webpack.config.babel.js`

- `index.html` file is the landing file, tweak it as neccesary

#### Create and push the docker image

- Modify the `index.html` to show the correct list of plots
- Run `docker build -t ghcr.io/scilifelabdatacentre/keywords-voc:{version} .`, replace `{version}` with appropriate one.