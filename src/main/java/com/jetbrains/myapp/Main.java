package com.jetbrains.myapp;
import com.jetbrains.myapp.entity.ItemEntity;
import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.InputMismatchException;
import java.util.List;
import java.util.Scanner;

public class Main {
    static EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("default");
    static EntityManager entityManager = entityManagerFactory.createEntityManager();
    static EntityTransaction transaction = entityManager.getTransaction();
    static ArrayList<Item> toDoList = new ArrayList<>();

    public static void main(String[] args) {
        // Clear the database upon application startup
        clearDatabase();

        Scanner scan = new Scanner(System.in);
        int userSelectionInput = 1;
        String userNameInput;
        int userPositionInput = 0;

        displayWelcomeMessage();
        getDatabaseList();

        while (userSelectionInput != 0) {
            displayUserOptions();
            userSelectionInput = getUserSelection(scan);

            switch (userSelectionInput) {
                case 0:
                    break;
                case 1:
                    System.out.println("Type in name of item");
                    userNameInput = scan.next();
                    addItem(userNameInput);
                    break;
                case 2:
                    if (toDoList.isEmpty()) {
                        System.out.println("List is empty\n");
                        break;
                    }
                    viewToDoListFromDatabase();
                    System.out.println("Type in position of item to delete from list");
                    userPositionInput = scan.nextInt();
                    deleteItem(userPositionInput);
                    break;
                case 3:
                    viewToDoListFromDatabase();
                    break;
            }
        }
        System.out.println("\nQuitting application...");
        entityManager.close();
        entityManagerFactory.close();
        System.exit(0);
    }

    public static void addItem(String name) {
        addItemToDatabase(name);
        System.out.println("Added item: " + name + "\n");
    }

    public static void addItemToDatabase(String name) {
        try {
            Item item = new Item(name);
            ItemEntity newItem = new ItemEntity();
            newItem.setName(item.getItemName());
            transaction.begin();
            entityManager.persist(newItem);
            transaction.commit();
        } finally {
            if (transaction.isActive()) {
                transaction.rollback();
            }
        }
    }

    public static void removeItemFromDatabase(int id) {
        try {
            transaction.begin();
            ItemEntity item = entityManager.find(ItemEntity.class, id);
            if (item != null) {
                entityManager.remove(item);
                System.out.println("Item ID " + id + " has been removed from the list\n");
            } else {
                System.out.println("Item with ID " + id + " not found.\n");
            }
            transaction.commit();
        } finally {
            if (transaction.isActive()) {
                transaction.rollback();
            }
        }
    }

    public static void getDatabaseList() {
        try {
            transaction.begin();
            Query getTableID = entityManager.createNativeQuery("SELECT ID from todolist.todo_items");
            Query getTableName = entityManager.createNativeQuery("SELECT description from todolist.todo_items");
            List IDList = getTableID.getResultList();
            List nameList = getTableName.getResultList();
            toDoList.clear();
            for (int i = 0; i < IDList.size(); i++) {
                Item newItem = new Item((String) nameList.get(i));
                newItem.setItemID((Integer) IDList.get(i));
                System.out.println("ID-" + newItem.getItemID() + " Name-" + newItem.getItemName());
                toDoList.add(newItem);
            }
            transaction.commit();
        } finally {
            if (transaction.isActive()) {
                transaction.rollback();
            }
        }
    }

    public static int getUserSelection(Scanner scan) {
        boolean correctInput = false;
        int userSelectionInput = 0;
        while (!correctInput) {
            try {
                userSelectionInput = scan.nextInt();
                correctInput = true;
            } catch (InputMismatchException e) {
                scan.next();
                System.out.println("Invalid input");
            }
        }
        return userSelectionInput;
    }

    public static void deleteItem(int id) {
        removeItemFromDatabase(id);
        System.out.println("Item ID " + id + " has been removed from the list\n");
    }

    public static void viewToDoListFromDatabase() {
        System.out.println("    To-Do List   ");
        System.out.println("-----------------");
        getDatabaseList();
        System.out.println();
    }

    public static void displayWelcomeMessage() {
        System.out.println("To-Do Application");
        System.out.println("-----------------");
    }

    public static void displayUserOptions() {
        System.out.println("Type 1 to add item");
        System.out.println("Type 2 to delete item");
        System.out.println("Type 3 to view item list");
        System.out.println("Type 0 to quit the application\n");
    }

    public static ArrayList<Item> getToDoList() {
        getDatabaseList();
        return toDoList;
    }

    public static void clearDatabase() {
        try {
            transaction.begin();
            entityManager.createNativeQuery("DELETE FROM todolist.todo_items").executeUpdate();
            transaction.commit();
        } finally {
            if (transaction.isActive()) {
                transaction.rollback();
            }
        }
    }
}
