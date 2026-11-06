# ==========================================
# STAGE 1: Verify environment structure
# ==========================================
FROM node:20-alpine AS builder
WORKDIR /app
COPY app.html ./dist/

# ==========================================
# STAGE 2: Secure Production Server Production Production Production
# ==========================================
FROM nginx:1.25-alpine

# Copy the static web calculator into Nginx default serving root
COPY --from=builder /app/dist/ /usr/share/nginx/html/

COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 80 to access your calculator outside the container
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
