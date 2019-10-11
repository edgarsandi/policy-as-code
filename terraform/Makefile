NAME := web

COMMAND := terraform
PLAN = $(NAME)-plan.tfplan
SHOW = $(NAME)-show.json
OPA  = $(NAME).rego

all: test

plan: $(PLAN)

$(PLAN):
	$(COMMAND) init
	$(COMMAND) plan -out $(PLAN)

show: $(SHOW)

$(SHOW): plan
	$(COMMAND) show -json $(PLAN) > $(SHOW)

test: show
	opa eval --data policy/$(OPA) --input $(SHOW) "data.terraform.security.sg_rule_check"

clean:
	@rm -f $(PLAN) $(SHOW)

.PHONY: plan show test all clean
