import React from "react";

const BlogPage = ({ blogItems }) => {
  return (
    <div className="min-h-screen flex flex-col">
      {/* Menu Section */}
      <header className="bg-blue-500 text-white py-4 px-6 flex justify-between items-center">
        <h1 className="text-xl font-bold">My Blog</h1>
        <nav>
          <ul className="flex space-x-4">
            <li><a href="#" className="hover:underline">Home</a></li>
            <li><a href="#" className="hover:underline">About</a></li>
            <li><a href="#" className="hover:underline">Contact</a></li>
          </ul>
        </nav>
      </header>

      {/* Blog Section */}
      <main className="flex-1 bg-gray-100 py-6 px-4">
        <div className="max-w-4xl mx-auto grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-6">
          {blogItems.map((item, index) => (
            <div key={index} className="bg-white shadow-md rounded-lg overflow-hidden">
              <img src={item.img} alt={item.title} className="w-full h-40 object-cover" />
              <div className="p-4">
                <h2 className="text-lg font-semibold mb-2">{item.title}</h2>
                <p className="text-gray-600 text-sm">{item.short_des}</p>
              </div>
            </div>
          ))}
        </div>
      </main>

      {/* Footer Section */}
      <footer className="bg-blue-500 text-white py-4 text-center">
        <p>&copy; {new Date().getFullYear()} My Blog. All rights reserved.</p>
      </footer>
    </div>
  );
};

export default BlogPage;

// Example usage
// const blogItems = [
//   { title: "Blog Post 1", short_des: "This is the first blog post.", img: "https://via.placeholder.com/150" },
//   { title: "Blog Post 2", short_des: "This is the second blog post.", img: "https://via.placeholder.com/150" },
//   { title: "Blog Post 3", short_des: "This is the third blog post.", img: "https://via.placeholder.com/150" },
// ];

// ReactDOM.render(<BlogPage blogItems={blogItems} />, document.getElementById("root"));
