FROM python:3-alpine as helper

COPY ["setup.py", "requirements.txt", "/mosmetro/"]
COPY ["mosmetro", "/mosmetro/mosmetro/"]
WORKDIR "/mosmetro"

RUN python -m venv venv && ./venv/bin/pip install -r requirements.txt

FROM python:3-alpine

COPY --from=helper /mosmetro /mosmetro
WORKDIR "/mosmetro"

CMD ["/mosmetro/venv/bin/python", "-m", "mosmetro"]