# Step 1: Base Image হিসেবে হালকা সাইজের Nginx আলপাইন ব্যবহার করা হচ্ছে
FROM nginx:alpine

# Step 2: ডিফল্ট Nginx কনফিগারেশন সরিয়ে আমাদের কাস্টম কনফিগ ফাইল কপি করা
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Step 3: প্রজেক্টের সব ফাইল Nginx HTML ডিরেক্টরিতে কপি করা
COPY . /usr/share/nginx/html

# Step 4: Port 80 এক্সপোজ করা (Render অটোমেটিক এটি ডিটেক্ট করবে)
EXPOSE 80

# Step 5: Nginx রান করা
CMD ["nginx", "-g", "daemon off;"]
