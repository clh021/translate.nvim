local args = require("libp.args")
local identity = require("libp.functional").identity

describe("get_default", function()
    it("Returns default if val is nil", function()
        assert.are.same(1, args.get_default(nil, 1))
        assert.are.same(false, args.get_default(nil, false))
    end)
    it("Returns val if val is not nil", function()
        assert.are.same(2, args.get_default(2, 3))
        assert.are.same(false, args.get_default(false, 3))
    end)
end)

describe("get_default_lazy", function()
    it("Returns default function result if val is nil", function()
        assert.are.same(1, args.get_default_lazy(nil, identity, 1))
        assert.are.same(false, args.get_default_lazy(nil, identity, false))
    end)
    it("Returns val if val is not nil", function()
        assert.are.same(2, args.get_default_lazy(2, identity, 3))
        assert.are.same(false, args.get_default_lazy(false, identity, 3))
    end)
end)

describe("non_nil", function()
    it("Returns ture for anything but null", function()
        vim.validate({ n = args.non_nil(1) })
        vim.validate({ n = args.non_nil(-1) })
        vim.validate({ n = args.non_nil(false) })

        assert.has.errors(function()
            vim.validate({ n = args.non_nil() })
        end)
    end)
end)

describe("positive", function()
    it("Returns ture for positive number", function()
        vim.validate({ n = args.positive(1) })
        vim.validate({ n = args.positive(2) })
    end)
    it("Returns false for non-number/non-positive number", function()
        assert.has.errors(function()
            vim.validate({ n = args.positive() })
        end)
        assert.has.errors(function()
            vim.validate({ n = args.positive(0) })
        end)
        assert.has.errors(function()
            vim.validate({ n = args.positive(-1) })
        end)
    end)
    it("Has a null_or version", function()
        vim.validate({ n = args.null_or.positive(1) })
        vim.validate({ n = args.null_or.positive() })
        assert.has.errors(function()
            vim.validate({ n = args.null_or.positive(0) })
        end)
    end)
end)

describe("is_class", function()
    local Class = require("libp.datatype.Class")
    local SubClass = Class:EXTEND()
    local SubClass2 = Class:EXTEND()
    it("Returns ture if inheritance hierarchy is correct", function()
        vim.validate({ n = args.is_class(SubClass(), SubClass) })
        assert.has.errors(function()
            vim.validate({ n = args.is_class(SubClass(), SubClass2) })
        end)
    end)
end)

describe("is_callable", function()
    it("Returns ture for callable", function()
        local f = function() end
        local ft = setmetatable({}, { __call = function() end })
        vim.validate({ n = args.is_callable(f) })
        vim.validate({ n = args.is_callable(ft) })
    end)
    it("Returns false for non-callable", function()
        assert.has.errors(function()
            vim.validate({ n = args.is_callable() })
        end)
        assert.has.errors(function()
            vim.validate({ n = args.is_callable(0) })
        end)
        assert.has.errors(function()
            vim.validate({ n = args.is_callable({}) })
        end)
    end)
    it("Has a null_or version", function()
        vim.validate({ n = args.null_or.is_callable(function() end) })
        vim.validate({ n = args.null_or.is_callable() })
        assert.has.errors(function()
            vim.validate({ n = args.null_or.is_callable(0) })
        end)
    end)
end)
