from tkinter import *
from tkinter import messagebox
from backend import *
import os.path
import os
import webbrowser

if os.path.exists("/Users/Piotr/Desktop/UJ/Databases/project/library_database.db"):
    os.remove("/Users/Piotr/Desktop/UJ/Databases/project/library_database.db")

database = Database("/Users/Piotr/Desktop/UJ/Databases/project/library_database.db")

class Window:
    def __init__(self, window, filename):
        self.window = window
        self.window.title(filename)

        # main labels
        l1 = Label(window, text="Title", padx=10, pady=8)
        l1.grid(row=0, column=0)
        l2 = Label(window, text="Author", padx=10, pady=8)
        l2.grid(row=0, column=2)
        l3 = Label(window, text="Type", padx=10, pady=8)
        l3.grid(row=1, column=0)
        l4 = Label(window, text="Supplier", padx=10, pady=8)
        l4.grid(row=1, column = 2)
        l3 = Label(window, text="Link", padx=10, pady=8)
        l3.grid(row=2, column=0)
        l4 = Label(window, text="Territory", padx=10, pady=8)
        l4.grid(row=2, column = 2)

        # main entries
        self.title_entry = Entry(window)
        self.title_entry.grid(row=0, column=1)
        self.title_entry.focus()
        self.author_entry = Entry(window)
        self.author_entry.grid(row=0, column=3)
        self.type_entry = Entry(window)
        self.type_entry.grid(row=1, column=1);
        self.supplier_entry = Entry(window)
        self.supplier_entry.grid(row=1, column=3)
        self.link_entry = Entry(window)
        self.link_entry.grid(row=2, column=1)
        self.territory_entry = Entry(window)
        self.territory_entry.grid(row=2, column=3)

        # list & scrollbar
        self.list1 = Listbox(window, height=10, width=45)
        self.list1.grid(row=3, column=0, rowspan=6, columnspan=2, padx=5, pady=5)

        self.scroll = Scrollbar(window)
        self.scroll.grid(row=3, column=2, rowspan=6)
        self.list1.bind("<<ListboxSelect>>", self.get_selected_row)

        self.list1.configure(yscrollcommand=self.scroll.set)
        self.scroll.configure(command=self.list1.yview)

        # buttons
        view_button = Button(text="View All", width=25, command=self.view_command)
        view_button.grid(row=3, column=3)

        search_button = Button(window, text="Search Title", width=25, command=self.search_title)
        search_button.grid(row=4, column=3)

        open_link = Button(window, text="Open Link", width=25, command=self.open_link)
        open_link.grid(row=5, column=3)

        update_button = Button(window, text="Update Title", width=25, command=self.update_command)
        update_button.grid(row=6, column=3)

        delete_button = Button(window, text="Delete Entry", width=25, command=self.delete_command)
        delete_button.grid(row=7, column=3)

        close_button = Button(window, text="Close", width=25, command = window.destroy)
        close_button.grid(row=8, column=3)

    def get_selected_row(self, event):
        index = self.list1.curselection()[0]
        self.selected_tuple = self.list1.get(index)
        self.title_entry.delete(0, END)
        self.title_entry.insert(END, self.selected_tuple[1])
        self.author_entry.delete(0, END)
        self.author_entry.insert(END, self.selected_tuple[2])
        self.type_entry.delete(0, END)
        self.type_entry.insert(END, self.selected_tuple[3])
        self.supplier_entry.delete(0, END)
        self.supplier_entry.insert(END, self.selected_tuple[4])
        self.link_entry.delete(0, END)
        self.link_entry.insert(END, self.selected_tuple[5])
        self.territory_entry.delete(0, END)
        self.territory_entry.insert(END, self.selected_tuple[6])

    def view_command(self):
        self.list1.delete(0,END)
        for row in database.view():
            self.list1.insert(END, row)

    def open_link(self):
        try:
            webbrowser.open(self.selected_tuple[5])
        except AttributeError:
            messagebox.showerror("Error Message", "To open a link, first select a book")

    def search_title(self):
        self.list1.delete(0, END)
        for row in database.search(self.title_entry.get()):
            self.list1.insert(END, row)

    def update_command(self):
        database.update(self.title_entry.get(), self.selected_tuple[0])
        self.view_command()

    def delete_command(self):
        database.delete(self.selected_tuple[0])
        self.view_command()

window = Tk()
window.geometry('750x294')
Window(window, "Library")
window.title("Library Database")
mainloop()
