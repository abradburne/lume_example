defmodule LumeExample.ThingsTest do
  use LumeExample.DataCase

  alias LumeExample.Things

  describe "things" do
    alias LumeExample.Things.Thing

    import LumeExample.ThingsFixtures

    @invalid_attrs %{name: nil}

    test "list_things/0 returns all things" do
      thing = thing_fixture()
      assert Things.list_things() == [thing]
    end

    test "get_thing!/1 returns the thing with given id" do
      thing = thing_fixture()
      assert Things.get_thing!(thing.id) == thing
    end

    test "create_thing/1 with valid data creates a thing" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Thing{} = thing} = Things.create_thing(valid_attrs)
      assert thing.name == "some name"
    end

    test "create_thing/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Things.create_thing(@invalid_attrs)
    end

    test "update_thing/2 with valid data updates the thing" do
      thing = thing_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Thing{} = thing} = Things.update_thing(thing, update_attrs)
      assert thing.name == "some updated name"
    end

    test "update_thing/2 with invalid data returns error changeset" do
      thing = thing_fixture()
      assert {:error, %Ecto.Changeset{}} = Things.update_thing(thing, @invalid_attrs)
      assert thing == Things.get_thing!(thing.id)
    end

    test "delete_thing/1 deletes the thing" do
      thing = thing_fixture()
      assert {:ok, %Thing{}} = Things.delete_thing(thing)
      assert_raise Ecto.NoResultsError, fn -> Things.get_thing!(thing.id) end
    end

    test "change_thing/1 returns a thing changeset" do
      thing = thing_fixture()
      assert %Ecto.Changeset{} = Things.change_thing(thing)
    end
  end
end
