#################################################
# Compile and minify less and livescript files. #
# Require node.js and npm                       #
#################################################

LESS_FOLDER = static/src/less
LS_FOLDER = static/src/ls
CSS_FOLDER = static/build/css
JS_FOLDER = static/build/js

CSS_FILE = ${CSS_FOLDER}/main.min.css
JS_FILE = ${JS_FOLDER}/main.min.js

###############
# Build files #
###############

build: build-css build-js

####################
# Build css files #
####################

build-css: ${CSS_FOLDER} ${CSS_FILE}

${CSS_FILE}: ${LESS_FOLDER}/*.less
	cat $^ | lessc - | cleancss > $@

${CSS_FOLDER}:
	mkdir -p $@

##################
# Build js files #
##################

build-js: ${JS_FOLDER} ${JS_FILE}

${JS_FILE}: ${LS_FOLDER}/*.ls
	cat $^ | lsc -sc | uglifyjs - > $@

${JS_FOLDER}:
	mkdir -p $@

###############
# Clean files #
###############

clean:
	rm ${CSS_FILE} ${JS_FILE}

########################
# Install dépendencies #
########################

install-dependencies:
	sudo npm install -g less clean-css livescript uglifyjs onchange

###############
# Watch files #
###############

watch:
	onchange "${LESS_FOLDER}/*.less" "${LS_FOLDER}/*.ls" -- make build

#########
# Phony #
#########

.PHONY: build build-css build-js clean watch install-dependencies
