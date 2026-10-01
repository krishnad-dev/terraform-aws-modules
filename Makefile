MODULES := modules/vpc modules/eks modules/s3-bucket modules/rds-postgres deployments/platform

.PHONY: fmt validate lint security check

fmt:
	terraform fmt -recursive

validate:
	@for d in $(MODULES); do \
		echo "==> $$d"; \
		terraform -chdir=$$d init -backend=false -input=false > /dev/null && \
		terraform -chdir=$$d validate || exit 1; \
	done

lint:
	tflint --init
	tflint --recursive --config "$(CURDIR)/.tflint.hcl"

security:
	checkov -d . --framework terraform --config-file .checkov.yml

check: fmt validate lint security
