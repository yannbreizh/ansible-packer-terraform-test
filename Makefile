# include .env
# export $(shell sed 's/=.*//' .env)

ti:
	cd terraform && terraform init && cd -

tp:
	cd terraform && \
	terraform plan && \
	cd -

ta:
	cd terraform && \
	terraform apply && \
	cd -

td:
	cd terraform && \
	terraform destroy && \
	cd -

pb:
	cd packer && \
	packer build ec2.json && \
	cd -
