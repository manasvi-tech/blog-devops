# Use official Node.js LTS Alpine image for minimal footprint
FROM node:20-alpine AS builder

WORKDIR /app
COPY package.json package-lock.json* pnpm-lock.yaml* ./
RUN npm install

COPY . .
RUN npm run build

# Production image
FROM node:20-alpine

WORKDIR /app
ENV NODE_ENV=production

COPY --from=builder /app ./
EXPOSE 3000

CMD ["npm", "start"]
