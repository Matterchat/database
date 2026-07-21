FROM node:22-alpine

WORKDIR /app
ENV CI=true

RUN corepack enable && corepack prepare pnpm@latest-11 --activate

# Copy workspace configuration files
COPY package.json pnpm-lock.yaml pnpm-workspace.yaml ./

# Copy database package and shared config package
COPY packages/database ./packages/database
COPY packages/config ./packages/config

# Install only the dependencies required
RUN pnpm install --filter=@matterchat/database --frozen-lockfile

WORKDIR /app/packages/database

# Run the prisma migrations deploy command on startup
CMD ["npx", "prisma", "migrate", "deploy"]
