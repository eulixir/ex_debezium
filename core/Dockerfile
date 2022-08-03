FROM elixir:1.13-alpine AS build

RUN apk update \
  && apk add --no-cache tzdata ncurses-libs postgresql-client build-base openssh-client git\
  && cp /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime \
  && echo "America/Sao_Paulo" > /etc/timezone \
  && apk del tzdata

RUN mkdir /root/.ssh

WORKDIR /app

ARG MIX_ENV=dev

RUN mix do local.hex --force, local.rebar --force


COPY mix.exs mix.lock ./
COPY config config

RUN mix do deps.get, deps.compile

COPY . ./
RUN mix do compile --warnings-as-errors, release

FROM alpine:3.16 AS app

# install dependencies
RUN apk upgrade --no-cache && \
  apk add ncurses-libs curl libgcc libstdc++

# setup timezone'
ENV TZ America/Sao_Paulo
RUN apk add --no-cache tzdata \
  && cp /usr/share/zoneinfo/$TZ /etc/localtime \
  && echo $TZ > /etc/timezone

# setup app
WORKDIR /app
ARG MIX_ENV=prod
COPY --from=build /app/_build/$MIX_ENV/rel/core ./

RUN ls
# start application
COPY start.sh ./
CMD ["sh", "./start.sh"]
