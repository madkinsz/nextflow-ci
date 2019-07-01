"""
Tests for py_module_ex.base
"""

from modules.py_module_ex import base


def test_one_plus_one():
    assert base.one_plus_one() == 2
