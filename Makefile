build:
	rm -rf public
	hugo

deploy: build
	aws s3 sync public/ s3://awesome-staticsites --acl public-read --delete
	aws configure set preview.cloudfront true
	aws cloudfront create-invalidation --distribution-id E1TOAY25LWA2TC --paths '/*'