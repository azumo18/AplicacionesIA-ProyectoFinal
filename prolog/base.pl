% ============================================================
% IT Resume Agent – Knowledge Base
% Phase 1 MVP – Atoms & Rules
% File: base.pl
% ============================================================

:- discontiguous(has_experience/2).
:- discontiguous(transferable_skill/3).
:- discontiguous(role_match/2).

:- dynamic(has_skill/2).
:- dynamic(experience_level/3).

% ============================================================
% SECTION 1 – ATOMS
% Concrete facts about technologies, skills, and concepts.
% ============================================================

% --- 1.1 Programming Languages ---

% JVM / C-family / Statically Typed
programming_language(java).
programming_language(kotlin).
programming_language(scala).
programming_language(csharp).
programming_language(cpp).
programming_language(c).
programming_language(swift).
programming_language(go).
programming_language(rust).

% Scripting / Dynamic
programming_language(python).
programming_language(ruby).
programming_language(javascript).
programming_language(typescript).
programming_language(php).
programming_language(perl).
programming_language(bash).
programming_language(powershell).

% Functional
programming_language(haskell).
programming_language(elixir).
programming_language(erlang).
programming_language(fsharp).
programming_language(clojure).

% Query / Data
programming_language(sql).
programming_language(graphql).
programming_language(r_language).

% Language subcategories
language_category(java, jvm).
language_category(kotlin, jvm).
language_category(scala, jvm).

language_category(java, c_family).
language_category(csharp, c_family).
language_category(cpp, c_family).
language_category(c, c_family).

language_category(java, statically_typed).
language_category(kotlin, statically_typed).
language_category(scala, statically_typed).
language_category(csharp, statically_typed).
language_category(cpp, statically_typed).
language_category(c, statically_typed).
language_category(swift, statically_typed).
language_category(go, statically_typed).
language_category(rust, statically_typed).

language_category(python, scripting).
language_category(ruby, scripting).
language_category(javascript, scripting).
language_category(typescript, scripting).
language_category(php, scripting).
language_category(perl, scripting).
language_category(bash, scripting).
language_category(powershell, scripting).

language_category(python, dynamic).
language_category(ruby, dynamic).
language_category(javascript, dynamic).
language_category(php, dynamic).

language_category(haskell, functional).
language_category(elixir, functional).
language_category(erlang, functional).
language_category(fsharp, functional).
language_category(clojure, functional).
language_category(scala, functional).

language_category(sql, query).
language_category(graphql, query).
language_category(r_language, data).

% --- 1.2 Programming Paradigms ---

paradigm(object_oriented_programming).
paradigm(functional_programming).
paradigm(procedural_programming).
paradigm(reactive_programming).
paradigm(event_driven_programming).
paradigm(declarative_programming).

% --- 1.3 Web Frameworks & Frontend ---

frontend_framework(react).
frontend_framework(angular).
frontend_framework(vue).
frontend_framework(svelte).
frontend_framework(nextjs).
frontend_framework(html_css).

backend_framework(spring_boot).
backend_framework(dotnet_core).
backend_framework(django).
backend_framework(flask).
backend_framework(fastapi).
backend_framework(rails).
backend_framework(express).
backend_framework(nestjs).
backend_framework(laravel).

% --- 1.4 Mobile Development ---

mobile_technology(android_native).
mobile_technology(ios_native).
mobile_technology(react_native).
mobile_technology(flutter).
mobile_technology(xamarin).
mobile_technology(ionic).

% --- 1.5 Databases ---

database(postgresql).
database(mysql).
database(mssql).
database(oracle_db).
database(sqlite).
database(mongodb).
database(couchdb).
database(firestore).
database(redis).
database(memcached).
database(dynamodb).
database(cassandra).
database(hbase).
database(bigquery).
database(neo4j).
database(amazon_neptune).
database(influxdb).
database(timescaledb).
database(elasticsearch).
database(opensearch).
database(solr).

database_category(postgresql, relational).
database_category(mysql, relational).
database_category(mssql, relational).
database_category(oracle_db, relational).
database_category(sqlite, relational).

database_category(mongodb, document).
database_category(couchdb, document).
database_category(firestore, document).

database_category(redis, key_value).
database_category(memcached, key_value).
database_category(dynamodb, key_value).

database_category(cassandra, column_store).
database_category(hbase, column_store).
database_category(bigquery, column_store).

database_category(neo4j, graph).
database_category(amazon_neptune, graph).

database_category(influxdb, time_series).
database_category(timescaledb, time_series).

database_category(elasticsearch, search_engine).
database_category(opensearch, search_engine).
database_category(solr, search_engine).

% --- 1.6 Cloud Platforms ---

cloud_platform(aws).
cloud_platform(azure).
cloud_platform(google_cloud).
cloud_platform(oracle_cloud).
cloud_platform(ibm_cloud).
cloud_platform(digitalocean).
cloud_platform(heroku).

major_cloud_provider(aws).
major_cloud_provider(azure).
major_cloud_provider(google_cloud).

% --- 1.7 Cloud Services (generic concepts) ---

cloud_service(cloud_compute).
cloud_service(cloud_storage).
cloud_service(cloud_networking).
cloud_service(cloud_iam).
cloud_service(cloud_functions).
cloud_service(cloud_managed_kubernetes).
cloud_service(cloud_managed_database).
cloud_service(cloud_cdn).
cloud_service(cloud_monitoring).

% --- 1.8 Infrastructure as Code (IaC) ---

iac_tool(terraform).
iac_tool(ansible).
iac_tool(puppet).
iac_tool(chef).
iac_tool(cloudformation).
iac_tool(pulumi).
iac_tool(bicep).

config_management_tool(ansible).
config_management_tool(puppet).
config_management_tool(chef).

% --- 1.9 Containerization & Orchestration ---

container_technology(docker).
container_technology(kubernetes).
container_technology(helm).
container_technology(docker_compose).
container_technology(podman).
container_technology(openshift).

% --- 1.10 CI/CD ---

cicd_tool(jenkins).
cicd_tool(github_actions).
cicd_tool(gitlab_ci).
cicd_tool(circleci).
cicd_tool(travis_ci).
cicd_tool(azure_devops_pipelines).
cicd_tool(argocd).
cicd_tool(spinnaker).
cicd_tool(teamcity).

% --- 1.11 Version Control ---

version_control(git).
version_control(svn).
version_control(mercurial).

% --- 1.12 Networking ---

networking_skill(tcp_ip_fundamentals).
networking_skill(dns).
networking_skill(http_https).
networking_skill(load_balancing).
networking_skill(vpn).
networking_skill(firewall_management).
networking_skill(network_monitoring).
networking_skill(software_defined_networking).
networking_skill(cdn_management).

% --- 1.13 Operating Systems / Server Management ---

os_skill(linux_administration).
os_skill(windows_server_administration).
os_skill(macos_administration).
os_skill(shell_scripting).
os_skill(system_performance_tuning).
os_skill(log_management).
os_skill(cron_job_management).

% --- 1.14 Security ---

security_skill(application_security).
security_skill(network_security).
security_skill(identity_and_access_management).
security_skill(penetration_testing).
security_skill(vulnerability_assessment).
security_skill(siem_tools).
security_skill(owasp_knowledge).
security_skill(ssl_tls_management).
security_skill(secrets_management).
security_skill(devsecops).

% --- 1.15 AI / Machine Learning ---

% Foundations
ai_skill(machine_learning_fundamentals).
ai_skill(deep_learning).
ai_skill(natural_language_processing).
ai_skill(computer_vision).
ai_skill(reinforcement_learning).
ai_skill(data_science).

% Frameworks & Tools
ai_framework(tensorflow).
ai_framework(pytorch).
ai_framework(keras).
ai_framework(scikit_learn).
ai_framework(hugging_face).
ai_framework(langchain).
ai_framework(llamaindex).
ai_framework(openai_api).
ai_framework(mlflow).
ai_framework(kubeflow).

% Concepts
ai_concept(llm_prompting).
ai_concept(rag).
ai_concept(fine_tuning).
ai_concept(vector_databases).
ai_concept(feature_engineering).
ai_concept(model_evaluation).
ai_concept(mlops).

% Vector Databases
vector_database(pinecone).
vector_database(weaviate).
vector_database(chroma).
vector_database(qdrant).
vector_database(pgvector).

% --- 1.16 Data Engineering & Big Data ---

data_engineering_tool(apache_spark).
data_engineering_tool(apache_kafka).
data_engineering_tool(apache_flink).
data_engineering_tool(apache_airflow).
data_engineering_tool(hadoop).
data_engineering_tool(dbt).

data_engineering_concept(data_warehousing).
data_engineering_concept(etl_pipelines).
data_engineering_concept(stream_processing).
data_engineering_concept(batch_processing).

% --- 1.17 Observability & Monitoring ---

observability_tool(prometheus).
observability_tool(grafana).
observability_tool(datadog).
observability_tool(newrelic).
observability_tool(splunk).
observability_tool(elk_stack).
observability_tool(opentelemetry).
observability_tool(jaeger).
observability_tool(pagerduty).

% --- 1.18 Integration & Messaging ---

integration_technology(rest_api).
integration_technology(soap_webservices).
integration_technology(grpc).
integration_technology(graphql).
integration_technology(rabbitmq).
integration_technology(apache_kafka).
integration_technology(activemq).
integration_technology(aws_sqs_sns).
integration_technology(mulesoft).
integration_technology(apigee).
integration_technology(ibm_mq).
integration_technology(webhooks).
integration_technology(event_streaming).

message_broker(rabbitmq).
message_broker(activemq).
message_broker(aws_sqs_sns).
message_broker(apache_kafka).
message_broker(ibm_mq).

% --- 1.19 Software Architecture & Design ---

architecture_pattern(microservices).
architecture_pattern(monolithic_architecture).
architecture_pattern(event_driven_architecture).
architecture_pattern(domain_driven_design).
architecture_pattern(cqrs).
architecture_pattern(api_gateway_pattern).
architecture_pattern(serverless_architecture).
architecture_pattern(hexagonal_architecture).
architecture_pattern(solid_principles).
architecture_pattern(design_patterns).

% --- 1.20 Project Management & Methodologies ---

% Traditional
pm_methodology(traditional_project_management).
pm_methodology(waterfall).
pm_methodology(pmp_certification).
pm_methodology(prince2).

% Agile Family
pm_methodology(agile_mindset).
pm_methodology(scrum).
pm_methodology(kanban).
pm_methodology(safe).
pm_methodology(less).
pm_methodology(xp).

agile_methodology(scrum).
agile_methodology(kanban).
agile_methodology(safe).
agile_methodology(less).
agile_methodology(xp).

traditional_methodology(traditional_project_management).
traditional_methodology(waterfall).
traditional_methodology(pmp_certification).
traditional_methodology(prince2).

% Supporting Practices
pm_tool(jira).
pm_tool(trello).
pm_tool(asana).
pm_tool(confluence).
pm_tool(technical_documentation).

% --- 1.21 IoT ---

iot_technology(iot_fundamentals).
iot_technology(mqtt_protocol).
iot_technology(embedded_systems).
iot_technology(raspberry_pi).
iot_technology(arduino).
iot_technology(edge_computing).
iot_technology(azure_iot_hub).
iot_technology(aws_iot_core).
iot_technology(modbus_protocol).
iot_technology(opcua_protocol).

% --- 1.22 Soft Skills / General IT ---

soft_skill(technical_leadership).
soft_skill(team_management).
soft_skill(code_review).
soft_skill(mentoring).
soft_skill(system_design_interviews).
soft_skill(stakeholder_communication).
soft_skill(remote_collaboration).


% ============================================================
% SECTION 2 – RULES
% Inference rules the engine can make.
% ============================================================
%
% has_skill(Candidate, Skill) – base facts (dynamic, loaded per candidate)
% has_experience(Candidate, DerivedSkill) – inferred experience
% transferable_skill(From, To, Strength) – skill transferability
% role_match(Candidate, Role) – composite role suitability
%
% Match strengths:
%   exact_match | strong_partial_match | moderate_partial_match |
%   weak_partial_match | no_match
%
% Experience levels:
%   expert_level | senior_level | mid_level | junior_level
% ============================================================

% Helper: a candidate "knows" a skill if it is declared or derived.
knows(Candidate, Skill) :-
    has_skill(Candidate, Skill).
knows(Candidate, Skill) :-
    has_experience(Candidate, Skill).

% --- 2.1 Paradigm Membership Rules ---

% Rule P1 – OOP Languages
has_experience(Candidate, object_oriented_programming) :-
    has_skill(Candidate, Lang),
    member(Lang, [java, kotlin, scala, csharp, cpp, swift, python, ruby, typescript, php]).

% Rule P2 – Functional Languages
has_experience(Candidate, functional_programming) :-
    has_skill(Candidate, Lang),
    member(Lang, [haskell, elixir, erlang, fsharp, clojure, scala]).

% Rule P3 – Scripting Background
has_experience(Candidate, scripting_background) :-
    has_skill(Candidate, Lang),
    member(Lang, [python, ruby, bash, powershell, perl, javascript]).

% Rule P4 – Statically Typed Background
has_experience(Candidate, statically_typed_background) :-
    has_skill(Candidate, Lang),
    member(Lang, [java, kotlin, csharp, cpp, go, rust, swift]).

% Rule P5 – Dynamically Typed Background
has_experience(Candidate, dynamically_typed_background) :-
    has_skill(Candidate, Lang),
    member(Lang, [python, javascript, ruby, php]).

% --- 2.2 Language Transferability Rules ---

% Rule L1 – JVM Ecosystem Transferability
jvm_language(java).
jvm_language(kotlin).
jvm_language(scala).

has_experience(Candidate, jvm_ecosystem) :-
    has_skill(Candidate, Lang),
    jvm_language(Lang).

transferable_skill(java, kotlin, strong_partial_match).
transferable_skill(java, scala, strong_partial_match).
transferable_skill(kotlin, java, strong_partial_match).
transferable_skill(kotlin, scala, strong_partial_match).
transferable_skill(scala, java, strong_partial_match).
transferable_skill(scala, kotlin, strong_partial_match).

% Rule L2 – C-Family Transferability (Java <-> C#)
transferable_skill(java, csharp, strong_partial_match).
transferable_skill(csharp, java, strong_partial_match).

% Rule L3 – C / C++ / Rust / Go Low-Level Transferability
transferable_skill(c, rust, moderate_partial_match).
transferable_skill(c, go, moderate_partial_match).
transferable_skill(cpp, rust, moderate_partial_match).
transferable_skill(cpp, go, moderate_partial_match).
transferable_skill(rust, c, moderate_partial_match).
transferable_skill(rust, cpp, moderate_partial_match).
transferable_skill(go, c, moderate_partial_match).
transferable_skill(go, cpp, moderate_partial_match).

% Rule L4 – JavaScript / TypeScript Equivalence
transferable_skill(javascript, typescript, strong_partial_match).
transferable_skill(typescript, javascript, strong_partial_match).

% Rule L5 – Python Data / Backend Dual Role
python_backend_framework(django).
python_backend_framework(flask).
python_backend_framework(fastapi).

python_data_framework(scikit_learn).
python_data_framework(tensorflow).
python_data_framework(pytorch).

has_experience(Candidate, python_backend) :-
    has_skill(Candidate, python),
    has_skill(Candidate, Framework),
    python_backend_framework(Framework).

has_experience(Candidate, python_data_science) :-
    has_skill(Candidate, python),
    has_skill(Candidate, Framework),
    python_data_framework(Framework).

% Rule L6 – Scripting Cross-Transfer (bash <-> powershell)
transferable_skill(bash, powershell, moderate_partial_match).
transferable_skill(powershell, bash, moderate_partial_match).

% Rule L7 – SQL as Universal Prerequisite
relational_db(postgresql).
relational_db(mysql).
relational_db(mssql).
relational_db(oracle_db).
relational_db(sqlite).

has_experience(Candidate, sql) :-
    has_skill(Candidate, DB),
    relational_db(DB).

% Rule L8 – General OOP Transferability
oop_language(java).
oop_language(kotlin).
oop_language(scala).
oop_language(csharp).
oop_language(cpp).
oop_language(swift).
oop_language(python).
oop_language(ruby).
oop_language(typescript).
oop_language(php).

% A candidate with OOP experience is a partial match for any OOP language
% they do not already know.
oop_partial_match(Candidate, RequiredLang, weak_partial_match) :-
    knows(Candidate, object_oriented_programming),
    oop_language(RequiredLang),
    \+ has_skill(Candidate, RequiredLang),
    % Not already covered by a stronger transferability rule
    \+ (has_skill(Candidate, Known), transferable_skill(Known, RequiredLang, _)).

% --- 2.3 Framework & Ecosystem Rules ---

% Rule F1 – Spring Boot implies Java Backend
has_experience(Candidate, java_backend) :-
    has_skill(Candidate, spring_boot).

has_experience(Candidate, java) :-
    has_skill(Candidate, spring_boot).

% Rule F2 – .NET Ecosystem
has_experience(Candidate, csharp) :-
    has_skill(Candidate, dotnet_core).

has_experience(Candidate, dotnet_core) :-
    has_skill(Candidate, csharp).

% Rule F3 – React / Next.js Equivalence
transferable_skill(react, nextjs, strong_partial_match).

has_experience(Candidate, react) :-
    has_skill(Candidate, nextjs).

% Rule F4 – Django / Flask / FastAPI Python Backend Equivalence
transferable_skill(django, flask, moderate_partial_match).
transferable_skill(django, fastapi, moderate_partial_match).
transferable_skill(flask, django, moderate_partial_match).
transferable_skill(flask, fastapi, moderate_partial_match).
transferable_skill(fastapi, django, moderate_partial_match).
transferable_skill(fastapi, flask, moderate_partial_match).

% Rule F5 – Frontend Framework Transferability
transferable_skill(react, vue, moderate_partial_match).
transferable_skill(vue, react, moderate_partial_match).
transferable_skill(angular, vue, moderate_partial_match).
transferable_skill(vue, angular, moderate_partial_match).
transferable_skill(react, angular, weak_partial_match).
transferable_skill(angular, react, weak_partial_match).

% Rule F6 – Rails implies Ruby
has_experience(Candidate, ruby) :-
    has_skill(Candidate, rails).

% Rule F7 – Express / NestJS Node Ecosystem
has_experience(Candidate, nodejs) :-
    has_skill(Candidate, express).

has_experience(Candidate, nodejs) :-
    has_skill(Candidate, nestjs).

transferable_skill(express, nestjs, moderate_partial_match).
transferable_skill(nestjs, express, moderate_partial_match).

% --- 2.4 Database Rules ---

% Rule D1 – Relational DB Transferability
transferable_skill(postgresql, mysql, moderate_partial_match).
transferable_skill(postgresql, mssql, moderate_partial_match).
transferable_skill(postgresql, oracle_db, moderate_partial_match).
transferable_skill(mysql, postgresql, moderate_partial_match).
transferable_skill(mysql, mssql, moderate_partial_match).
transferable_skill(mysql, oracle_db, moderate_partial_match).
transferable_skill(mssql, postgresql, moderate_partial_match).
transferable_skill(mssql, mysql, moderate_partial_match).
transferable_skill(mssql, oracle_db, moderate_partial_match).
transferable_skill(oracle_db, postgresql, moderate_partial_match).
transferable_skill(oracle_db, mysql, moderate_partial_match).
transferable_skill(oracle_db, mssql, moderate_partial_match).

% Rule D2 – Document DB Transferability
document_db(mongodb).
document_db(couchdb).
document_db(firestore).

transferable_skill(mongodb, couchdb, moderate_partial_match).
transferable_skill(mongodb, firestore, moderate_partial_match).
transferable_skill(couchdb, mongodb, moderate_partial_match).
transferable_skill(couchdb, firestore, moderate_partial_match).
transferable_skill(firestore, mongodb, moderate_partial_match).
transferable_skill(firestore, couchdb, moderate_partial_match).

% Rule D3 – NoSQL General Awareness
nosql_db(mongodb).
nosql_db(cassandra).
nosql_db(dynamodb).
nosql_db(redis).
nosql_db(neo4j).

has_experience(Candidate, nosql_awareness) :-
    has_skill(Candidate, DB),
    nosql_db(DB).

% Rule D4 – Cache / Key-Value Transferability
transferable_skill(redis, memcached, moderate_partial_match).
transferable_skill(memcached, redis, moderate_partial_match).

% Rule D5 – Search Engine Transferability
transferable_skill(elasticsearch, opensearch, strong_partial_match).
transferable_skill(opensearch, elasticsearch, strong_partial_match).

% Rule D6 – Vector DB implies AI stack awareness
has_experience(Candidate, vector_database_experience) :-
    has_skill(Candidate, VDB),
    vector_database(VDB).

has_experience(Candidate, rag) :-
    knows(Candidate, vector_database_experience).

has_experience(Candidate, llm_integration_experience) :-
    knows(Candidate, vector_database_experience).

% --- 2.5 Cloud Platform Rules ---

% Rule C1 – Multi-Cloud Fundamentals Transfer
has_experience(Candidate, cloud_fundamentals) :-
    has_skill(Candidate, Provider),
    major_cloud_provider(Provider).

% Rule C2 – AWS implies core cloud services
has_experience(Candidate, cloud_compute) :- has_skill(Candidate, aws).
has_experience(Candidate, cloud_storage) :- has_skill(Candidate, aws).
has_experience(Candidate, cloud_networking) :- has_skill(Candidate, aws).
has_experience(Candidate, cloud_iam) :- has_skill(Candidate, aws).

% Rule C3 – Same for Azure and GCP
has_experience(Candidate, cloud_compute) :- has_skill(Candidate, azure).
has_experience(Candidate, cloud_storage) :- has_skill(Candidate, azure).
has_experience(Candidate, cloud_networking) :- has_skill(Candidate, azure).
has_experience(Candidate, cloud_iam) :- has_skill(Candidate, azure).

has_experience(Candidate, cloud_compute) :- has_skill(Candidate, google_cloud).
has_experience(Candidate, cloud_storage) :- has_skill(Candidate, google_cloud).
has_experience(Candidate, cloud_networking) :- has_skill(Candidate, google_cloud).
has_experience(Candidate, cloud_iam) :- has_skill(Candidate, google_cloud).

% Rule C4 – Cloud Provider Partial Match
transferable_skill(aws, azure, moderate_partial_match).
transferable_skill(azure, aws, moderate_partial_match).
transferable_skill(aws, google_cloud, weak_partial_match).
transferable_skill(google_cloud, aws, weak_partial_match).
transferable_skill(azure, google_cloud, weak_partial_match).
transferable_skill(google_cloud, azure, weak_partial_match).

% Rule C5 – Serverless Awareness
has_experience(Candidate, serverless_architecture) :-
    has_skill(Candidate, cloud_functions).

% --- 2.6 Infrastructure as Code Rules ---

% Rule I1 – Terraform <-> Pulumi Transferability
transferable_skill(terraform, pulumi, strong_partial_match).
transferable_skill(pulumi, terraform, strong_partial_match).

% Rule I2 – Ansible <-> Terraform Partial Match
transferable_skill(ansible, terraform, moderate_partial_match).
transferable_skill(terraform, ansible, moderate_partial_match).

% Rule I3 – Ansible <-> Puppet <-> Chef Transferability
transferable_skill(ansible, puppet, moderate_partial_match).
transferable_skill(ansible, chef, moderate_partial_match).
transferable_skill(puppet, ansible, moderate_partial_match).
transferable_skill(puppet, chef, moderate_partial_match).
transferable_skill(chef, ansible, moderate_partial_match).
transferable_skill(chef, puppet, moderate_partial_match).

% Rule I4 – CloudFormation implies AWS IaC
has_experience(Candidate, iac_awareness) :-
    has_skill(Candidate, cloudformation).

has_experience(Candidate, aws) :-
    has_skill(Candidate, cloudformation).

transferable_skill(cloudformation, terraform, moderate_partial_match).
transferable_skill(terraform, cloudformation, moderate_partial_match).

% Rule I5 – General IaC Awareness
has_experience(Candidate, iac_awareness) :-
    has_skill(Candidate, Tool),
    iac_tool(Tool).

% --- 2.7 Containerization & Orchestration Rules ---

% Rule K1 – Docker is prerequisite for Kubernetes
has_experience(Candidate, docker) :-
    has_skill(Candidate, kubernetes).

transferable_skill(docker, kubernetes, weak_partial_match).

% Rule K2 – Kubernetes <-> OpenShift
transferable_skill(kubernetes, openshift, strong_partial_match).
transferable_skill(openshift, kubernetes, strong_partial_match).

% Rule K3 – Helm implies Kubernetes
has_experience(Candidate, kubernetes) :-
    has_skill(Candidate, helm).

has_experience(Candidate, docker) :-
    has_skill(Candidate, helm).

% Rule K4 – Container Orchestration Awareness
has_experience(Candidate, container_orchestration_experience) :-
    has_skill(Candidate, kubernetes).

has_experience(Candidate, container_orchestration_experience) :-
    has_skill(Candidate, openshift).

has_experience(Candidate, container_orchestration_experience) :-
    has_skill(Candidate, docker_compose).

% --- 2.8 CI/CD Rules ---

% Rule CI1 – CI/CD Tool Transferability
% All CI/CD tools share universal pipeline concepts.
cicd_transferable(jenkins).
cicd_transferable(github_actions).
cicd_transferable(gitlab_ci).
cicd_transferable(circleci).
cicd_transferable(travis_ci).
cicd_transferable(azure_devops_pipelines).
cicd_transferable(teamcity).

transferable_skill(From, To, moderate_partial_match) :-
    cicd_transferable(From),
    cicd_transferable(To),
    From \= To.

% Rule CI2 – GitOps Awareness
has_experience(Candidate, gitops) :-
    has_skill(Candidate, argocd).

has_experience(Candidate, gitops) :-
    has_skill(Candidate, spinnaker).

% Rule CI3 – General CI/CD Awareness
has_experience(Candidate, cicd_awareness) :-
    has_skill(Candidate, Tool),
    cicd_tool(Tool).

% --- 2.9 Networking Rules ---

% Rule N1 – Networking Fundamentals as Foundation
has_experience(Candidate, dns) :-
    has_skill(Candidate, tcp_ip_fundamentals).

has_experience(Candidate, http_https) :-
    has_skill(Candidate, tcp_ip_fundamentals).

has_experience(Candidate, load_balancing) :-
    has_skill(Candidate, tcp_ip_fundamentals).

has_experience(Candidate, vpn) :-
    has_skill(Candidate, tcp_ip_fundamentals).

% Rule N2 – Linux Admin implies Networking Basics
has_experience(Candidate, tcp_ip_fundamentals) :-
    has_skill(Candidate, linux_administration).

has_experience(Candidate, dns) :-
    has_skill(Candidate, linux_administration).

has_experience(Candidate, firewall_management) :-
    has_skill(Candidate, linux_administration).

% Rule N3 – Cloud Networking implies General Networking
transferable_skill(cloud_networking, tcp_ip_fundamentals, moderate_partial_match).
transferable_skill(cloud_networking, load_balancing, moderate_partial_match).

% --- 2.10 Project Management Rules ---

% Rule PM1 – Agile Methods Hierarchy
has_experience(Candidate, agile_mindset) :-
    has_skill(Candidate, scrum).

has_experience(Candidate, agile_mindset) :-
    has_skill(Candidate, kanban).

% Rule PM2 – Kanban to Scrum Transferability
transferable_skill(kanban, scrum, strong_partial_match).
transferable_skill(scrum, kanban, strong_partial_match).

% Rule PM3 – Traditional PM to Agile Partial Match
transferable_skill(traditional_project_management, agile_mindset, weak_partial_match).
transferable_skill(waterfall, agile_mindset, weak_partial_match).
transferable_skill(pmp_certification, agile_mindset, weak_partial_match).
transferable_skill(prince2, agile_mindset, weak_partial_match).

% Rule PM4 – SAFe / LeSS implies Scrum
has_experience(Candidate, scrum) :-
    has_skill(Candidate, safe).

has_experience(Candidate, scrum) :-
    has_skill(Candidate, less).

has_experience(Candidate, agile_mindset) :-
    has_skill(Candidate, safe).

has_experience(Candidate, agile_mindset) :-
    has_skill(Candidate, less).

% Rule PM5 – XP implies Agile and Engineering Practices
has_experience(Candidate, agile_mindset) :-
    has_skill(Candidate, xp).

has_experience(Candidate, tdd) :-
    has_skill(Candidate, xp).

has_experience(Candidate, pair_programming) :-
    has_skill(Candidate, xp).

has_experience(Candidate, continuous_integration) :-
    has_skill(Candidate, xp).

% Rule PM6 – Project Management Umbrella
has_experience(Candidate, project_management_awareness) :-
    has_skill(Candidate, Method),
    member(Method, [scrum, kanban, safe, less, xp, waterfall, pmp_certification, prince2]).

% --- 2.11 Messaging & Integration Rules ---

% Rule MQ1 – Message Broker Transferability
transferable_skill(rabbitmq, activemq, moderate_partial_match).
transferable_skill(rabbitmq, aws_sqs_sns, moderate_partial_match).
transferable_skill(activemq, rabbitmq, moderate_partial_match).
transferable_skill(activemq, aws_sqs_sns, moderate_partial_match).
transferable_skill(aws_sqs_sns, rabbitmq, moderate_partial_match).
transferable_skill(aws_sqs_sns, activemq, moderate_partial_match).

% Rule MQ2 – Kafka as Event Streaming Specialist
has_experience(Candidate, event_streaming) :-
    has_skill(Candidate, apache_kafka).

transferable_skill(apache_kafka, rabbitmq, moderate_partial_match).
transferable_skill(apache_kafka, activemq, moderate_partial_match).

% Rule MQ3 – REST API as Universal Integration Skill
has_experience(Candidate, web_services_experience) :-
    has_skill(Candidate, rest_api).

% Rule MQ4 – SOAP implies Legacy Integration Awareness
has_experience(Candidate, legacy_integration_awareness) :-
    has_skill(Candidate, soap_webservices).

transferable_skill(soap_webservices, rest_api, weak_partial_match).
transferable_skill(soap_webservices, grpc, weak_partial_match).

% Rule MQ5 – gRPC implies REST Partial Match
transferable_skill(grpc, rest_api, strong_partial_match).

has_experience(Candidate, protocol_buffers) :-
    has_skill(Candidate, grpc).

% Rule MQ6 – MuleSoft / Apigee implies Enterprise Integration
has_experience(Candidate, enterprise_integration_experience) :-
    has_skill(Candidate, mulesoft).

has_experience(Candidate, enterprise_integration_experience) :-
    has_skill(Candidate, apigee).

has_experience(Candidate, api_gateway) :-
    has_skill(Candidate, mulesoft).

has_experience(Candidate, api_gateway) :-
    has_skill(Candidate, apigee).

% --- 2.12 AI / Machine Learning Rules ---

% Rule AI1 – ML Frameworks Transferability
transferable_skill(tensorflow, pytorch, moderate_partial_match).
transferable_skill(pytorch, tensorflow, moderate_partial_match).

% Rule AI2 – Keras implies TensorFlow
has_experience(Candidate, tensorflow) :-
    has_skill(Candidate, keras).

% Rule AI3 – Scikit-learn implies ML Fundamentals
has_experience(Candidate, machine_learning_fundamentals) :-
    has_skill(Candidate, scikit_learn).

% Rule AI4 – LangChain / LlamaIndex implies LLM Integration Experience
has_experience(Candidate, llm_integration_experience) :-
    has_skill(Candidate, langchain).

has_experience(Candidate, llm_integration_experience) :-
    has_skill(Candidate, llamaindex).

has_experience(Candidate, rag) :-
    has_skill(Candidate, langchain).

has_experience(Candidate, rag) :-
    has_skill(Candidate, llamaindex).

has_experience(Candidate, llm_prompting) :-
    has_skill(Candidate, langchain).

has_experience(Candidate, llm_prompting) :-
    has_skill(Candidate, llamaindex).

has_experience(Candidate, vector_databases) :-
    has_skill(Candidate, langchain).

has_experience(Candidate, vector_databases) :-
    has_skill(Candidate, llamaindex).

% Rule AI5 – Data Science implies ML Familiarity
transferable_skill(data_science, machine_learning_fundamentals, moderate_partial_match).

% Rule AI6 – MLOps implies DevOps + ML
has_experience(Candidate, cicd_awareness) :-
    has_skill(Candidate, mlops).

has_experience(Candidate, machine_learning_fundamentals) :-
    has_skill(Candidate, mlops).

% Rule AI7 – Fine-Tuning implies Deep Learning
has_experience(Candidate, deep_learning) :-
    has_skill(Candidate, fine_tuning).

has_experience(Candidate, llm_prompting) :-
    has_skill(Candidate, fine_tuning).

% Rule AI8 – Computer Vision implies Deep Learning
has_experience(Candidate, deep_learning) :-
    has_skill(Candidate, computer_vision).

% Rule AI9 – NLP implies ML Fundamentals
has_experience(Candidate, machine_learning_fundamentals) :-
    has_skill(Candidate, natural_language_processing).

% --- 2.13 IoT Rules ---

% Rule IOT1 – IoT implies Networking Awareness
has_experience(Candidate, tcp_ip_fundamentals) :-
    has_skill(Candidate, iot_fundamentals).

has_experience(Candidate, mqtt_protocol) :-
    has_skill(Candidate, iot_fundamentals).

% Rule IOT2 – Embedded Systems implies Low-Level Programming
has_experience(Candidate, c) :-
    has_skill(Candidate, embedded_systems).

has_experience(Candidate, cpp) :-
    has_skill(Candidate, embedded_systems).

% Rule IOT3 – Edge Computing implies IoT and Cloud
has_experience(Candidate, iot_fundamentals) :-
    has_skill(Candidate, edge_computing).

has_experience(Candidate, cloud_fundamentals) :-
    has_skill(Candidate, edge_computing).

% Rule IOT4 – Cloud IoT Services Transferability
transferable_skill(azure_iot_hub, aws_iot_core, moderate_partial_match).
transferable_skill(aws_iot_core, azure_iot_hub, moderate_partial_match).

% --- 2.14 Observability Rules ---

% Rule OB1 – Prometheus <-> Grafana Stack
has_experience(Candidate, grafana) :-
    has_skill(Candidate, prometheus).

has_experience(Candidate, prometheus) :-
    has_skill(Candidate, grafana).

% Rule OB2 – ELK Stack Awareness
has_experience(Candidate, log_management) :-
    has_skill(Candidate, elk_stack).

has_experience(Candidate, elasticsearch) :-
    has_skill(Candidate, elk_stack).

has_experience(Candidate, log_management) :-
    (has_skill(Candidate, elasticsearch),
     has_skill(Candidate, logstash),
     has_skill(Candidate, kibana)).

% Rule OB3 – Monitoring Tool Transferability
transferable_skill(datadog, newrelic, moderate_partial_match).
transferable_skill(datadog, splunk, moderate_partial_match).
transferable_skill(newrelic, datadog, moderate_partial_match).
transferable_skill(newrelic, splunk, moderate_partial_match).
transferable_skill(splunk, datadog, moderate_partial_match).
transferable_skill(splunk, newrelic, moderate_partial_match).

% Rule OB4 – OpenTelemetry implies Observability Maturity
has_experience(Candidate, observability_experience) :-
    has_skill(Candidate, opentelemetry).

% --- 2.15 Seniority & Role Composite Rules ---

% Backend languages and their associated frameworks
backend_language_framework(java, spring_boot).
backend_language_framework(csharp, dotnet_core).
backend_language_framework(python, django).
backend_language_framework(python, flask).
backend_language_framework(python, fastapi).
backend_language_framework(ruby, rails).
backend_language_framework(javascript, express).
backend_language_framework(javascript, nestjs).
backend_language_framework(typescript, express).
backend_language_framework(typescript, nestjs).
backend_language_framework(php, laravel).
backend_language_framework(go, go).
backend_language_framework(rust, rust).
backend_language_framework(kotlin, spring_boot).

% Rule SR1 – Junior Backend Developer Match
has_backend_experience(Candidate) :-
    has_skill(Candidate, Lang),
    has_skill(Candidate, Framework),
    backend_language_framework(Lang, Framework).

% Also covers implied frameworks (e.g., spring_boot implies java)
has_backend_experience(Candidate) :-
    has_skill(Candidate, Framework),
    backend_framework(Framework).

role_match(Candidate, junior_backend_developer) :-
    has_backend_experience(Candidate).

% Rule SR2 – Mid-Level Full Stack Match
has_frontend_experience(Candidate) :-
    has_skill(Candidate, FW),
    member(FW, [react, angular, vue, nextjs]).

has_database_experience(Candidate) :-
    has_skill(Candidate, DB),
    (database_category(DB, relational) ; database_category(DB, document)).

role_match(Candidate, mid_fullstack_developer) :-
    has_backend_experience(Candidate),
    has_frontend_experience(Candidate),
    has_database_experience(Candidate).

% Rule SR3 – DevOps / Platform Engineer Match
role_match(Candidate, devops_engineer) :-
    knows(Candidate, cicd_awareness),
    knows(Candidate, container_orchestration_experience),
    knows(Candidate, iac_awareness),
    knows(Candidate, cloud_fundamentals).

% Rule SR4 – Data Engineer Match
big_data_tool(apache_spark).
big_data_tool(apache_kafka).
big_data_tool(apache_flink).
big_data_tool(apache_airflow).

role_match(Candidate, data_engineer) :-
    knows(Candidate, sql),
    has_skill(Candidate, Tool),
    big_data_tool(Tool),
    knows(Candidate, cloud_fundamentals).

% Rule SR5 – ML Engineer Match
ml_framework(tensorflow).
ml_framework(pytorch).
ml_framework(scikit_learn).

role_match(Candidate, ml_engineer) :-
    knows(Candidate, machine_learning_fundamentals),
    knows(Candidate, python_data_science),
    has_skill(Candidate, FW),
    ml_framework(FW).

% Rule SR6 – Security Engineer Match
security_domain(application_security).
security_domain(network_security).
security_domain(penetration_testing).
security_domain(vulnerability_assessment).
security_domain(siem_tools).

role_match(Candidate, security_engineer) :-
    has_skill(Candidate, S1),
    has_skill(Candidate, S2),
    security_domain(S1),
    security_domain(S2),
    S1 \= S2.

% Rule SR7 – Technical Lead Match
role_match(Candidate, technical_lead) :-
    (has_skill(Candidate, technical_leadership) ; has_skill(Candidate, mentoring)),
    knows(Candidate, project_management_awareness).

% Rule SR8 – AI / LLM Integration Engineer Match
role_match(Candidate, ai_llm_integration_engineer) :-
    knows(Candidate, llm_prompting),
    (has_skill(Candidate, langchain) ; has_skill(Candidate, llamaindex)),
    knows(Candidate, vector_database_experience),
    (has_skill(Candidate, rest_api) ; has_skill(Candidate, grpc)).

% --- 2.16 Match Strength Qualifiers ---

match_strength(exact_match).
match_strength(strong_partial_match).
match_strength(moderate_partial_match).
match_strength(weak_partial_match).
match_strength(no_match).

% Ordering: higher is better
match_strength_rank(exact_match, 4).
match_strength_rank(strong_partial_match, 3).
match_strength_rank(moderate_partial_match, 2).
match_strength_rank(weak_partial_match, 1).
match_strength_rank(no_match, 0).

stronger_match(A, B) :-
    match_strength_rank(A, RA),
    match_strength_rank(B, RB),
    RA > RB.

% Determine match strength between a candidate skill and a requirement
evaluate_match(Candidate, Required, exact_match) :-
    has_skill(Candidate, Required).

evaluate_match(Candidate, Required, exact_match) :-
    has_experience(Candidate, Required).

evaluate_match(Candidate, Required, Strength) :-
    has_skill(Candidate, Known),
    transferable_skill(Known, Required, Strength).

evaluate_match(Candidate, Required, no_match) :-
    \+ has_skill(Candidate, Required),
    \+ has_experience(Candidate, Required),
    \+ (has_skill(Candidate, Known), transferable_skill(Known, Required, _)).

% --- 2.17 Experience Level Modifiers ---

experience_level_rank(expert_level, 4).
experience_level_rank(senior_level, 3).
experience_level_rank(mid_level, 2).
experience_level_rank(junior_level, 1).

% A strong partial match at expert level can outweigh an exact match at junior level
% for senior positions.
effective_match_score(Candidate, Skill, Score) :-
    evaluate_match(Candidate, Skill, MatchStrength),
    match_strength_rank(MatchStrength, MR),
    (   experience_level(Candidate, Skill, Level)
    ->  experience_level_rank(Level, LR)
    ;   LR = 1  % default to junior if unspecified
    ),
    Score is MR * LR.
