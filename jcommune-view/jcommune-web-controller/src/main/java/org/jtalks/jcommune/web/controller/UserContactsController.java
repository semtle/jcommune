/**
 * Copyright (C) 2011  JTalks.org Team
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 */
package org.jtalks.jcommune.web.controller;

import org.jtalks.jcommune.model.entity.UserContact;
import org.jtalks.jcommune.model.entity.UserContactType;
import org.jtalks.jcommune.service.UserContactsService;
import org.jtalks.jcommune.service.exceptions.NotFoundException;
import org.jtalks.jcommune.web.dto.UserContactDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * This controller handles creation and deletion of user contacts.
 *
 * @author Evgeniy Naumenko
 * @author Michael Gamov
 */
@Controller
public class UserContactsController {

    private UserContactsService service;

    /**
     * @param service to delegate business logic invocation
     */
    @Autowired
    public UserContactsController(UserContactsService service) {
        this.service = service;
    }

    /**
     * Renders available contact types as a JSON array.
     * @return contact types
     */
    @RequestMapping(value="/contacts/types", method = RequestMethod.GET)
    @ResponseBody
    public UserContactType[] getContactTypes() {
        List<UserContactType> types = service.getAvailableContactTypes();
        return types.toArray(new UserContactType[types.size()]);
    }

    /**
     * Handles creation of new contact for current user.
     * @param userContact user contact information
     * @return saved user contact (with updated id)
     * @throws NotFoundException
     */
    @RequestMapping(value="/contacts/add", method = RequestMethod.POST)
    @ResponseBody public UserContactDto addContact(@RequestBody UserContact userContact) throws NotFoundException {
        return UserContactDto.getDtoFor(service.addContact(userContact));
    }

    /**
     * Removes contact identified by contactId from user contacts.
     * @param contactId identifier of contact to be removed
     */
    @RequestMapping(value = "/contacts/remove/{contactId}", method = RequestMethod.DELETE)
    public void removeContact(@PathVariable Long contactId){
        service.removeContact(contactId);
    }
}
