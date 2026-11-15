FROM node:22-alpine AS build
WORKDIR /app
COPY package*.json ./
COPY apps/api/package*.json ./apps/api/
RUN npm install
COPY apps/api ./apps/api
COPY prisma ./prisma
COPY tsconfig.json ./
RUN npx prisma generate
RUN npm run build

FROM node:22-alpine
WORKDIR /app
COPY package*.json ./
COPY apps/api/package*.json ./apps/api/
RUN npm install --omit=dev
COPY --from=build /app/apps/api/dist ./apps/api/dist
COPY --from=build /app/node_modules/.prisma ./node_modules/.prisma
COPY --from=build /app/node_modules/@prisma ./node_modules/@prisma
EXPOSE 4000
CMD ["node","apps/api/dist/server.js"]
