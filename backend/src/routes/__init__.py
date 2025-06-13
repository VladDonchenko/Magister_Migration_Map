# -*- coding: utf-8 -*-

"""
Модуль с маршрутами API
"""

from .migration import router as migration_router
from .cities import router as cities_router

__all__ = ['migration_router', 'cities_router'] 