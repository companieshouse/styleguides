# Ansible

Ansible is the default tool used for configuring cloud infrastructure

## Directories
Avoid leaving empty folders or files in the playbook. For example, if a role has no handlers or a group has no speific group variables then do not include empty files. These can be created in future if there is a requirement.

## Roles
Roles names should be distribution agnostic.

## Tasks
Always include names for tasks.

Don’t include reference to the conditions of a task in the task name. Limit the description to the action being taken, not extra detail such as why it’s being done.
```yaml
# Do
- name: “Install nginx”

# Don't:
- name: “Install nginx if not already installed”
```

Split lines in tasks to make the playbook more readable.  
```yaml
# Do
template:
  src: etc/nginx/conf.d/nginx-server.conf.j2
  dest: /etc/nginx/conf.d/nginx-server-{{item.nginx_port}}.conf
  mode: 0444
  owner: root

# Don't:
template: src=etc/nginx/conf.d/release-server.conf.j2 dest=/etc/nginx/conf.d/release-server.conf mode=0444 owner=root
```

Ensure no-logging is set for sensitive variables.
```yaml
# Do
- name: Do that secret thing.
  ...
  no_log: true
```

## Handlers
Ensure handlers are named consistently and are unique (globally name-spaced).

## Templates
Only use templates where there is a requirement for embedded variables. If the file is static, then place this in the 'files' folder and use 'copy'.
#### yum
Where using templates (or files) for installing packages via yum, ensure encryption is used by setting gpgcheck=1 and referencing the location of the gpgkey. For example:

## Variables
Ensure variable names are represented in snake_case.
#### Facts
Always make use of existing Ansible facts (e.g. “ansible_os_family” or “ansible_distribution”) rather than running shell commands to determine this information.
Make use of set_fact to create variables to use in future tasks.

## Scripts
Stick with common scripts from other repos for consistency. Encrypt / decrypt etc.
