package com.codeup.adlister.controllers;
import com.codeup.adlister.dao.DaoFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(name="controllers.DogsServlet", urlPatterns = "/dogs")
public class DogsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("dogs", DaoFactory.getListingsDao().allDogs());
        request.getRequestDispatcher("/WEB-INF/ads/pet-listings.jsp").forward(request, response);
    }
}
