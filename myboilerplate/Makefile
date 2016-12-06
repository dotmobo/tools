#########################################################
# Compile and minify stylus, livescript and pug files. #
# Require node.js and npm                               #
#########################################################

# Source
STYLUS_FOLDER := source/stylus
LS_FOLDER := source/ls
PUG_FOLDER := source/pug
STYLUS_FILES := ${shell find ${STYLUS_FOLDER} -type f -name '*.styl'}
LS_FILES := ${shell find ${LS_FOLDER} -type f -name '*.ls'}
PUG_FILES := ${shell find ${PUG_FOLDER} -type f -name '*.pug'}

# Build
CSS_FOLDER := _build/static/dist/css
JS_FOLDER := _build/static/dist/js
HTML_FOLDER := _build
CSS_FILE := ${CSS_FOLDER}/main.min.css
JS_FILE := ${JS_FOLDER}/main.min.js
HTML_FILES := ${PUG_FILES:source/pug/%.pug=_build/%.html}

###############
# Build files #
###############

build: build-css build-js build-html

####################
# Build html files #
####################

build-html: ${HTML_FOLDER} ${HTML_FILES}

${HTML_FILES}: ${PUG_FILES}
	pug $^ --out ${HTML_FOLDER}

${HTML_FOLDER}:
	mkdir -p $@

####################
# Build css files #
####################

build-css: ${CSS_FOLDER} ${CSS_FILE}

${CSS_FILE}: ${STYLUS_FILES}
	cat $^ | stylus | cleancss > $@

${CSS_FOLDER}:
	mkdir -p $@

##################
# Build js files #
##################

build-js: ${JS_FOLDER} ${JS_FILE}

${JS_FILE}: ${LS_FILES}
	cat $^ | lsc -sc | uglifyjs - > $@

${JS_FOLDER}:
	mkdir -p $@

###############
# Clean files #
###############

clean:
	rm ${CSS_FILE} ${JS_FILE} ${HTML_FILES}

########################
# Install dépendencies #
########################

install-dependencies:
	sudo npm install -g stylus clean-css livescript uglifyjs onchange pug

###############
# Watch files #
###############

watch:
	onchange "${STYLUS_FILES}" "${LS_FILES}" "${PUG_FILES}" -- make build

##############
# Serve site #
##############

serve:
	cd _build && python3 -m http.server

#########
# Phony #
#########

.PHONY: build build-css build-js clean watch install-dependencies build-html serve
