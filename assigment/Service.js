import React from "react";

const ServicePage = ({ services }) => {
  return (
    <div className="min-h-screen flex flex-col">
      {/* Menu Section */}
      <header className="bg-blue-500 text-white py-4 px-6 flex justify-between items-center">
        <h1 className="text-xl font-bold">Our Services</h1>
        <nav>
          <ul className="flex space-x-4">
            <li><a href="#" className="hover:underline">Home</a></li>
            <li><a href="#" className="hover:underline">About</a></li>
            <li><a href="#" className="hover:underline">Contact</a></li>
          </ul>
        </nav>
      </header>

      {/* Service Section */}
      <main className="flex-1 bg-gray-100 py-6 px-4">
        <div className="max-w-4xl mx-auto grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-6">
          {services.map((service, index) => (
            <div key={index} className="bg-white shadow-md rounded-lg overflow-hidden">
              <img src={service.img} alt={service.title} className="w-full h-40 object-cover" />
              <div className="p-4">
                <h2 className="text-lg font-semibold mb-2">{service.title}</h2>
                <p className="text-gray-600 text-sm">{service.description}</p>
              </div>
            </div>
          ))}
        </div>
      </main>

      {/* Footer Section */}
      <footer className="bg-blue-500 text-white py-4 text-center">
        <p>&copy; {new Date().getFullYear()} Our Services. All rights reserved.</p>
      </footer>
    </div>
  );
};

export default ServicePage;

// Example usage
// const services = [
//   { title: "Web Development", description: "We build responsive websites.", img: "https://via.placeholder.com/150" },
//   { title: "Graphic Design", description: "Creative graphic design solutions.", img: "https://via.placeholder.com/150" },
//   { title: "SEO Services", description: "Improve your site's visibility.", img: "https://via.placeholder.com/150" },
// ];

// ReactDOM.render(<ServicePage services={services} />, document.getElementById("root"));
