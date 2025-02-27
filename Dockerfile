#
# Copyright 2022 IBM Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Build the manager binary
FROM quay.io/operator-framework/helm-operator:1.6.0

ARG VCS_REF
ARG VCS_URL

LABEL org.label-schema.vendor="IBM" \
    org.label-schema.name="ibm-platform-api-operator" \
    org.label-schema.description="IBM Platform API Operator" \
    org.label-schema.vcs-ref=$VCS_REF \
    org.label-schema.vcs-url=$VCS_URL \
    org.label-schema.license="Licensed Materials - Property of IBM" \
    org.label-schema.schema-version="1.0" \
    name="ibm-platform-api-operator" \
    vendor="IBM" \
    description="IBM Platform API Operator" \
    summary="IBM Platform API Operator" \
    release=$VCS_REF

ENV HOME=/opt/helm
COPY watches.yaml ${HOME}/watches.yaml
COPY helm-charts ${HOME}/helm-charts
COPY LICENSE /licenses/
WORKDIR ${HOME}
