package org.intensio.controller.command.Impl;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.intensio.beans.Attributes;
import org.intensio.beans.Languages;
import org.intensio.controller.command.Command;

import java.io.IOException;

public class ChangeLangCommand implements Command {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int newInd = ((int)session.getAttribute(Attributes.LANG_ATTRIBUTE) + 1) % Languages.values().length;
        session.setAttribute(Attributes.LANG_NAME_ATTRIBUTE, Languages.values()[newInd].toString());
        session.setAttribute(Attributes.LANG_ATTRIBUTE, newInd);
        return null;
    }
}
