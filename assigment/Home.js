import React from "react";
import { Swiper, SwiperSlide } from "swiper/react";
import "swiper/css";

const HomePage = () => {
  return (
    <div className="min-h-screen flex flex-col">
      {/* Menu */}
      <header className="bg-blue-500 text-white p-4 shadow-md">
        <div className="container mx-auto flex justify-between items-center">
          <h1 className="text-xl font-bold">My Website</h1>
          <nav>
            <ul className="flex gap-4">
              <li><a href="#home" className="hover:underline">Home</a></li>
              <li><a href="#blog" className="hover:underline">Blog</a></li>
              <li><a href="#contact" className="hover:underline">Contact</a></li>
            </ul>
          </nav>
        </div>
      </header>

      {/* Hero/Slider Section */}
      <section className="bg-gray-100 py-10">
        <div className="container mx-auto">
          <Swiper spaceBetween={30} slidesPerView={1} loop={true}>
            <SwiperSlide>
              <div className="bg-blue-300 p-10 rounded-lg shadow-md text-center">
                <h2 className="text-2xl font-bold mb-4">Welcome to My Website</h2>
                <p>Discover amazing content and stay updated.</p>
              </div>
            </SwiperSlide>
            <SwiperSlide>
              <div className="bg-green-300 p-10 rounded-lg shadow-md text-center">
                <h2 className="text-2xl font-bold mb-4">Explore Our Blog</h2>
                <p>Get insights, tips, and stories from experts.</p>
              </div>
            </SwiperSlide>
          </Swiper>
        </div>
      </section>

      {/* Blog Section */}
      <section id="blog" className="bg-white py-10">
        <div className="container mx-auto">
          <h2 className="text-3xl font-bold mb-6 text-center">Latest Blogs</h2>
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            {[...Array(6)].map((_, index) => (
              <div key={index} className="bg-gray-100 p-4 rounded-lg shadow-md">
                <img
                  src={`https://via.placeholder.com/150?text=Blog+${index + 1}`}
                  alt={`Blog ${index + 1}`}
                  className="w-full h-40 object-cover rounded-md mb-4"
                />
                <h3 className="text-xl font-bold mb-2">Blog Title {index + 1}</h3>
                <p className="text-gray-600">This is a short description of the blog post.</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Footer */}
      <footer className="bg-gray-800 text-white py-6 mt-auto">
        <div className="container mx-auto text-center">
          <p>&copy; 2025 My Website. All rights reserved.</p>
        </div>
      </footer>
    </div>
  );
};

export default HomePage;
