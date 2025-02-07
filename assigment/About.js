import React from "react";
import { Card, CardContent } from "@/components/ui/card";
import { Button } from "@/components/ui/button";

const AboutPage = () => {
  const teamMembers = [
    {
      id: 1,
      name: "John Doe",
      position: "Developer",
      image: "https://via.placeholder.com/150",
    },
    {
      id: 2,
      name: "Jane Smith",
      position: "Designer",
      image: "https://via.placeholder.com/150",
    },
    {
      id: 3,
      name: "Mike Johnson",
      position: "Project Manager",
      image: "https://via.placeholder.com/150",
    },
  ];

  return (
    <div className="min-h-screen flex flex-col">
      {/* Menu Section */}
      <nav className="bg-gray-800 text-white p-4">
        <div className="container mx-auto flex justify-between items-center">
          <h1 className="text-xl font-bold">About Us</h1>
          <ul className="flex space-x-4">
            <li><a href="#about" className="hover:underline">About</a></li>
            <li><a href="#team" className="hover:underline">Team</a></li>
            <li><a href="#footer" className="hover:underline">Contact</a></li>
          </ul>
        </div>
      </nav>

      {/* About Section */}
      <section id="about" className="bg-gray-100 py-10 px-4">
        <div className="container mx-auto text-center">
          <h2 className="text-3xl font-bold mb-4">Who We Are</h2>
          <p className="text-gray-600 max-w-2xl mx-auto">
            We are a team of passionate individuals dedicated to delivering the best solutions for your needs. Our mission is to create innovative and impactful work.
          </p>
        </div>
      </section>

      {/* Team Section */}
      <section id="team" className="py-10 px-4">
        <div className="container mx-auto">
          <h2 className="text-3xl font-bold text-center mb-8">Meet Our Team</h2>
          <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-6">
            {teamMembers.map((member) => (
              <Card key={member.id} className="shadow-lg">
                <img src={member.image} alt={member.name} className="w-full h-48 object-cover rounded-t-lg" />
                <CardContent className="p-4 text-center">
                  <h3 className="text-xl font-bold mb-2">{member.name}</h3>
                  <p className="text-gray-600 mb-4">{member.position}</p>
                  <Button className="bg-blue-500 text-white">View Profile</Button>
                </CardContent>
              </Card>
            ))}
          </div>
        </div>
      </section>

      {/* Footer Section */}
      <footer id="footer" className="bg-gray-800 text-white py-6">
        <div className="container mx-auto text-center">
          <p>&copy; 2025 Your Company. All rights reserved.</p>
        </div>
      </footer>
    </div>
  );
};

export default AboutPage;
